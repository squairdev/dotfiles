# <h1 align="center" style="font-size:35px">`squairdev/dotfiles` </h1>

### <h3 align="center" style="font-size:25px">My custom Dotfiles for Hyprland.</h3>

<div align="center">
<img src="https://github.com/squairdev/dotfiles/blob/main/images/treesPreview.png" width="300"/>
<img src="https://github.com/squairdev/dotfiles/blob/main/images/redPreview.png" width="300"/>
<img src="https://github.com/squairdev/dotfiles/blob/main/images/japanPreview.png" width="300"/>
<img src="https://github.com/squairdev/dotfiles/blob/main/images/ricePreview.png" width="300"/>
</div>

<h2 align="center" style="font-size:25px">Installation</h2>
Simply run this command in the linux terminal:

> [!CAUTION]
>
> This script is EXTREMELY experimental and most likely won't work if you don't run it from a fresh install of Arch Linux. You have been warned.

<br>

`bash <(curl -s https://hypr.squair.xyz)`
<h2 align="center" style="font-size:25px">Packages</h2>

<details>
  <summary>Wofi (Launcher)</summary><br>
  <img src="images/wofiPreview.png" width="200"/><br>
  The main app launcher for these dotfiles.
  
## Installation
1. Install Wofi<br>
`sudo pacman -S wofi`

2. Copying the files<br>
Once the repository has been cloned/downloaded, copy the files over:<br>
`dotfiles/.config/wofi/*` to `~/.config/wofi`

</details>
<br>
<details>
  <summary>Hyprlock (Lockscreen)</summary><br>
  <img src="images/hyprlockPreview.png" width="250"/><br>
  Lockscreen for Hyprland. Loads on boot.

## Installation
1. Install Hyprlock<br>
`sudo pacman -S hyprlock`

2. Copying the files<br>
Once the repository has been cloned/downloaded, copy the file over:<br>
`dotfiles/.config/hypr/hyprlock.conf` to `~/.config/hypr/hyprlock.conf`

</details>
<br>
<details>
  <summary>Hyprshot (Screenshot)</summary><br>
  Screenshot tool for Hyprland.

## Installation
1. Install Hyprshot<br>
`sudo pacman -S hyprshot grim`
</details>
<br>
<details>
  <summary>Ashell (Taskbar)</summary><br>
  <img src="images/ashellPreview.png" width="750"/><br>
  Taskbar for Hyprland. Loads on boot.

## Installation
1. Install Ashell<br>
`yay -S ashell`

2. Copying the file<br>
Once the repository has been cloned/downloaded, copy the file over:<br>
`dotfiles/.config/ashell/config.toml` to `~/.config/ashell/config.toml`

3. Restart Hyprland<br>
`Mod+M`
<br>return to hyprland (`hyprland`)
</details>
<br>
<details>
  <summary>Pywal/SWWW (Wallpaper managers)</summary><br>
  <img src="images/swwwPreview.png" width="250"/><br>
  Wallpaper managers for Hyprland.

## Installation
1. Install Pywal and SWWW<br>
`yay -S pywal`<br>
`sudo pacman -S swww`

2. Copying the files<br>
Once the repository has been cloned/downloaded, copy the files over:<br>
`dotfiles/wallpapers/*` to `~/wallpapers/walls`<br>
`dotfiles/.config/wal/*` to `~/.config/wal`<br>
`dotfiles/.config/hypr/wallpaper.sh` to `~/.config/hypr/wallpaper.sh`
</details>
More documentation coming soon.
<h2 align="center" style="font-size:25px">Keybinds</h2>

<details>
  <summary>App related keybinds</summary>

- `Mod+Q` Open termainal (kitty)

-  `Mod+R` Open Wofi (App launcher)

-  `Mod+F` Open Files (Nautilus)

-  `Mod+B` Close app

-  `Mod+M` Quit Hyprland
</details>
<br>
<details>
  <summary>Window related keybinds</summary>

- `Mod+L` Lock screen (hyprlock)

- `CTRL+PRINT` Region Screenshot (Hyprshot)

- `PRINT` Screenshot (Grim)

- `Mod+V` Popout window
  -  `Mod+LeftMouse` Drag window
  -  `Mod+Shift+LeftMouse` Resize window
</details>
<br>
<details>
  <summary>Workspace related keybinds</summary>

- `Mod+1-9` Switch workspace

- `Mod+Shift+1-9` Move window to workspace

- `Alt+[arrow keys]` Move window

- `Alt+W` Wallpaper switcher
</details>
<br>
<details>
  <summary>Miscellaneous app keybinds</summary>

  - `ALT+F` Fastfetch

  - `ALT+C` Cmatrix

  - `ALT+B` BTOP++

  - `ALT+V` Cava

  - `ALT+P` Music player (coming soon)
</details>

<h2 align="center" style="font-size:25px">Help</h2>
<details>
  <summary>Screenshot keybinds not working</summary>
If for some reason the keybinds for screenshotting don't work, try reinstalling the packages:

<br>

`sudo pacman -S hyprshot grim`
</details>
<br>
<details>
  <summary>Some features not installed</summary>
If you run `hyprland` and ashell (taskbar) is not displaying, re-run the script inside of kitty (terminal):

<br>

`bash <(curl -s https://hypr.squair.xyz)`
</details>

<h2 align="center" style="font-size:25px">Tested distros</h2>
Only officially tested on Arch linux.<br>
I installed Hyprland straight from a fresh install (only tty, no DM)