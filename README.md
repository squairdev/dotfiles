# <h1 align="center" style="font-size:35px">`squairdev/dotfiles` </h1>

### <h3 align="center" style="font-size:25px">My custom Dotfiles for Hyprland.</h3>

<div align="center">
<img src="https://github.com/squairdev/dotfiles/blob/main/images/treesPreview.png" width="300"/>
<img src="https://github.com/squairdev/dotfiles/blob/main/images/redPreview.png" width="300"/>
<img src="https://github.com/squairdev/dotfiles/blob/main/images/japanPreview.png" width="300"/>
</div>

<h2 align="center" style="font-size:25px">Installation</h2>
Simply run this command in the linux terminal:

> [!CAUTION]
>
> This script is EXTREMELY experimental and most likely won't work if you don't run it from a fresh install of Arch Linux. You have been warned.

<br>

`bash <(curl -s https://hypr.squair.xyz)`

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
If you run `hyprland` and you get a `hyprland: command not found` error, first reinstall hyprland:

<br>

`sudo pacman -S hyprland`

Then once you get into hyprland (simply run `hyprland` in the terminal), re-run the install script in the terminal (Mod+Q).
</details>

<h2 align="center" style="font-size:25px">Tested distros</h2>
Only officially tested on Arch linux.<br>
I installed Hyprland straight from a fresh install (only tty, no DM)