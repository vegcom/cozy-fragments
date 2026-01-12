# Cozy-Fragments

_Forkable, fun, and cozy_

**Wanted terminal fragments that provide:**

- base configuration
- targets
- profiles
- a cozy bit of flair

## Quick Start

```pwsh
& install.ps1
```

- MSXI paths by default work 
    ( e.g. `$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json` )

- TO set a path for exe installer define before running script

```pwsh
$settingsPath = Join-Path $env:LOCALAPPDATA "\Microsoft\Windows Terminal\settings.json"
```

## How do?

- Installs fragments

```pwsh
& wt-install_fragments.ps1
```

- Some settings have to be merged to the settings.json

```pwsh
& wt-merge_config.ps1
```

## Want a nice colour theme?

Use Twilight - https://github.com/vegcom/WindowsTerminal-Twilite

```jsonc
    // Colours
    "colorScheme": "Twilite",
    "unfocusedAppearance": {
        "colorScheme": "Twilite (Darker)"
    },
```

## License

MIT