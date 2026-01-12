# Cozy-Fragments

**Wanted terminal fragments that provide:**

- base configuration
- targets
- profiles
- a cozy bit of flair

<p style="text-align: center;"> <img src="https://raw.githubusercontent.com/vegcom/Twilite-Theme/main/assets/icon.png" alt="icon" width="148"/> </p>
<p style="text-align: center;"> <i>Forkable,&emsp;<br>&emsp;fun,<br>&emsp;&emsp;&emsp;and cozy</i></p>

## Quick Start

```pwsh
&"install.ps1"
```

- MSXI paths by default work 
    ( e.g. `$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json` )

- TO set a path for exe installer define before running script

```pwsh
$settingsPath = Join-Path $env:LOCALAPPDATA "\Microsoft\Windows Terminal\settings.json"
```

## How do?

- Installs (fragments)[./Fragments]

```pwsh
&"wt-install_fragments.ps1"
```

- Some settings have to be merged to the settings.json
    - our _"fragments"_ for this are in (Settings)[./Settings]

```pwsh
&"wt-merge_config.ps1"
```

## Want a nice colour theme?

Use Twilight - https://github.com/vegcom/WindowsTerminal-Twilite

```pwsh
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/vegcom/WindowsTerminal-Twilite/main/install.ps1'))
```

```jsonc
    // Colours
    "colorScheme": "Twilite",
    "unfocusedAppearance": {
        "colorScheme": "Twilite (Darker)"
    },
```

## License

MIT