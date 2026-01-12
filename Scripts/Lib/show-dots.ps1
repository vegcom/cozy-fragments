function Show-Dots {
    param([int]$Count = 120)
    1..$Count | ForEach-Object { Write-Host -NoNewline "." }
    Write-Host ""
}