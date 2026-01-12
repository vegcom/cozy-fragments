# install.ps1 — base installer

$root = $PSScriptRoot

Write-Host "📦 Cozy Fragments Installer"
Write-Host "Project root: $root"

# Run fragment installer
& "$root\Scripts\wt-install_fragments.ps1"

# Run config merger
& "$root\Scripts\wt-merge_config.ps1"

Write-Host "✨ Installation complete"
