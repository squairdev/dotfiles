#!/bin/bash
# this is only after installing the dotfiles. after hyprland runs for the first time, you can delete this. if you chose not to remove this, nothing will change.
if [ ! -f ~/.cache/current_wallpaper ]; then
    sleep 2
    awww img "$HOME/.cache/walStartup.png"
    wal -n -i "$HOME/.cache/walStartup.png" --backend haishoku
    echo "$HOME/.cache/walStartup.png" > $HOME/.cache/current_wallpaper
    hyprctl reload
else
    exit
fi