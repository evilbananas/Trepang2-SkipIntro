# Trepang2 - Skip Intro

A [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS) mod for **Trepang2** that skips the intro screens and boots straight to the main menu.

## Requirements
- Trepang2
- [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS/releases) v3.0.1 or newer

## Installation

### 1. Install UE4SS
Download the UE4SS release zip (`UE4SS_v3.x.x.zip`, not the `zDEV` one). Only these three files are needed:

| File | Purpose |
|---|---|
| `dwmapi.dll` | Loads UE4SS when the game starts |
| `UE4SS.dll` | UE4SS itself |
| `UE4SS-settings.ini` | UE4SS settings |

Extract just those three files into:
```
Trepang2\CPPFPS\Binaries\Win64\
```

### 2. Install the mod
Download the latest zip from [Releases](https://github.com/<your-github-username>/trepang2-skip-intro/releases) and extract it into the `Trepang2` folder. You should end up with:
```
Trepang2\CPPFPS\Binaries\Win64\Mods\SkipPressAnyKey\
```

### 3. Disable the intro logo videos
The logo videos can't be skipped by the mod, so rename them instead. Go to `Trepang2\CPPFPS\Content\Movies\` and add `.bak` to the end of these three files:

| Original name | Rename to |
|---|---|
| `T17_Logo.mp4` | `T17_Logo.mp4.bak` |
| `TrepangStudios_Logo.mp4` | `TrepangStudios_Logo.mp4.bak` |
| `TrepangGameLogo.mp4` | `TrepangGameLogo.mp4.bak` |

## Disabling / Uninstalling
- **Remove the mod:** delete the `CPPFPS\Binaries\Win64\Mods\SkipPressAnyKey` folder.
- **Remove UE4SS:** delete `dwmapi.dll`, `UE4SS.dll`, `UE4SS-settings.ini` and the `Mods` folder from `CPPFPS\Binaries\Win64\`. Also delete `UE4SS.log` and any `.cache` files if they're there.

## Also available on
- [Nexus Mods](<nexus-link>)

## Credits
- [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS) by the UE4SS-RE team (MIT License)

## License
[MIT](LICENSE)
