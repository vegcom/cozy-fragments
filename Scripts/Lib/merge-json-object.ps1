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