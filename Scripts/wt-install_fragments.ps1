$fragmentRoot = "C:\ProgramData\Microsoft\Windows Terminal\Fragments\Cozy-Fragments"
$iconRoot = "C:\ProgramData\WT\icons\Cozy-Icons"

function Show-Dots {
    param([int]$Count = 120)
    1..$Count | ForEach-Object { Write-Host -NoNewline "." }
    Write-Host ""
}

Write-Host "🎆 Cleanup directory structure"
Remove-Item -Recurse -Force -Path $fragmentRoot -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force -Path $iconRoot -ErrorAction SilentlyContinue
Show-Dots

Write-Host "🎆 Create directory structure"
New-Item -ItemType Directory -Force -Path $fragmentRoot | Out-Null
New-Item -ItemType Directory -Force -Path $iconRoot | Out-Null
Show-Dots

Write-Host "🎆 Fragments"
Get-ChildItem -Path "./Fragments" -Filter "*.json" | ForEach-Object {
    Write-Host "    🌻 $_.FullName -> $fragmentRoot/$_"
    Copy-Item $_.FullName -Destination $fragmentRoot -Force
}
Show-Dots

Write-Host "🎆 Icons"
Get-ChildItem -Path "./Icons" -Filter "*.png" | ForEach-Object {
    Write-Host "    🌻 $_.FullName -> $iconRoot/$_"
    Copy-Item -Path $_.FullName -Destination $iconRoot -Force
}
Show-Dots


