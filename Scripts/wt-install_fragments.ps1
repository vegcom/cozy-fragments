. ./Scripts/Lib/show-dots.ps1

$fragmentRoot = "C:\ProgramData\Microsoft\Windows Terminal\Fragments\Cozy-Fragments"
$iconRoot = "C:\ProgramData\WT\icons\Cozy-Icons"

Write-Host "🎆 Cleanup directory structure"
Remove-Item -Recurse -Force -Path $fragmentRoot -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force -Path $iconRoot -ErrorAction SilentlyContinue
Show-Dots

Write-Host "🎆 (Re-)reate directory structure"
New-Item -ItemType Directory -Force -Path $fragmentRoot | Out-Null
New-Item -ItemType Directory -Force -Path $iconRoot | Out-Null
Show-Dots

Write-Host "🎆 Fragments"
Get-ChildItem -Path "./Fragments" -Filter "*.json" | ForEach-Object {
    Write-Host "    🌻 $_"
    Copy-Item $_.FullName -Destination $fragmentRoot -Force
}
Show-Dots

Write-Host "🎆 Icons"
Get-ChildItem -Path "./Icons" -Filter "*.png" | ForEach-Object {
    Write-Host "    🌻 $_"
    Copy-Item -Path $_.FullName -Destination $iconRoot -Force
}
Show-Dots