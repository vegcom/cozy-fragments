. ./Scripts/Lib/merge-json-object.ps1
. ./Scripts/Lib/show-dots.ps1

if (-not $settingsPath) {
    $settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}
$backupPath   = "$settingsPath.bak"

Write-Host "🎆 Backup"
Write-Host "    🌻 $settingsPath -> $backupPath"
Copy-Item $settingsPath $backupPath -Force
Show-Dots

Write-Host "🎆 Load user settings"
$settings = Get-Content $settingsPath -Raw | ConvertFrom-Json
Show-Dots

Write-Host "🎆 Load fragments"
$config = Get-Content ".\Settings\config.json" -Raw | ConvertFrom-Json
$menu   = Get-Content ".\Settings\menu.json"   -Raw | ConvertFrom-Json
Show-Dots

Write-Host "🎆 Deep merge"
Merge-JsonObject -Base $settings -Overlay $config | Out-Null
Merge-JsonObject -Base $settings -Overlay $menu   | Out-Null
Show-Dots

Write-Host "🎆 Wrte back"
$settings | ConvertTo-Json -Depth 20 | Set-Content $settingsPath
Show-Dots
