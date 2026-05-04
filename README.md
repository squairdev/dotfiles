# <h1 align="center" style="font-size:35px">`squairdev/dotfiles` </h1>

### <h3 align="center" style="font-size:25px">My custom Dotfiles for Hyprland.</h3>

<img src="https://github.com/squairdev/dotfiles/blob/main/gitassets/rice0.png" width="50%"/><img src="https://github.com/squairdev/dotfiles/blob/main/gitassets/rice1.png" width="50%"/><img src="https://github.com/squairdev/dotfiles/blob/main/gitassets/rice2.png" width="50%"/><img src="https://github.com/squairdev/dotfiles/blob/main/gitassets/rice3.png" width="50%"/>
<p align="center" style="font-size:12px; margin-top:-15px">(note; pictures are captured on a 1440p 27" monitor. Scaling may be different on your end.)</p>

<h2 align="center" style="font-size:25px">Installation</h2>
Run this command in terminal:

```bash <(curl -s https://hypr.squair.xyz)```

or, directly from the repository:

```bash <(curl -s https://raw.githubusercontent.com/squairdev/dotfiles/refs/heads/main/install.sh)```

<h2 align="center" style="font-size:25px">Notes</h2>
For the wallpaper script (/bin/swal) to work correctly with Dunst (notification daemon), you must create a symlink.

after applying a wallpaper (so cache gets created), run:

```sudo ln -s ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc```

If you have any issues, feel free to open an issue or contact me.

<h2 align="center" style="font-size:25px">Tested distros</h2>
Only officially tested on Arch and Gentoo.

I installed Hyprland straight from a fresh install (from tty).