function Merge-JsonObject {
    param(
        [Parameter(Mandatory)] $Base,
        [Parameter(Mandatory)] $Overlay
    )

    foreach ($key in $Overlay.PSObject.Properties.Name) {
        $overlayValue = $Overlay.$key

        if ($Base.PSObject.Properties.Name -contains $key) {
            $baseValue = $Base.$key

            # If both sides are objects → recurse
            if ($baseValue -is [System.Management.Automation.PSObject] -and
                $overlayValue -is [System.Management.Automation.PSObject]) {

                Merge-JsonObject -Base $baseValue -Overlay $overlayValue
            }
            else {
                # Overlay wins only when explicitly defined
                $Base.$key = $overlayValue
            }
        }
        else {
            # New key → add it
            $Base | Add-Member -NotePropertyName $key -NotePropertyValue $overlayValue
        }
    }

    return $Base
}

if (-not $settingsPath) {
    $settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}
$backupPath   = "$settingsPath.bak"

# 1. Backup
Copy-Item $settingsPath $backupPath -Force

# 2. Load user settings
$settings = Get-Content $settingsPath -Raw | ConvertFrom-Json

# 3. Load your fragments
$config = Get-Content ".\config.json" -Raw | ConvertFrom-Json
$menu   = Get-Content ".\menu.json"   -Raw | ConvertFrom-Json

# 4. Deep merge
Merge-JsonObject -Base $settings -Overlay $config | Out-Null
Merge-JsonObject -Base $settings -Overlay $menu   | Out-Null

# 5. Write back
$settings | ConvertTo-Json -Depth 20 | Set-Content $settingsPath
