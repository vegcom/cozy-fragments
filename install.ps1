$fragmentRoot = "C:\ProgramData\Microsoft\Windows Terminal\Fragments\Cozy-Fragments"

$iconRoot = "C:\ProgramData\WT\icons"

# 
New-Item -ItemType Directory -Force -Path $fragmentRoot | Out-Null
New-Item -ItemType Directory -Force -Path $iconRoot | Out-Null

# Copy all JSON fragments
Get-ChildItem -Path "." -Filter "*.json" | ForEach-Object {
    Copy-Item $_.FullName -Destination $fragmentRoot -Force
}

# Copy all icons
Copy-Item -Path ".\icons\*.png" -Destination $iconRoot -Force
