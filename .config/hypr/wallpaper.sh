#!/bin/bash
WALLPAPER_DIR="$HOME/wallpapers/walls"

random_transition_type() {
    echo $(shuf -e left outer top bottom -n 1)
}

random_angle() {
    echo $((RANDOM % 360))
}
random_time(){
    echo 0.75
}

# I don't know what the heck I'm doing
# script is half stolen from elifouts/Dotfiles :3
menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
}

main() {
    choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
    selected_wallpaper=$(echo "$choice" | sed 's/^img://')

    transition_type=$(random_transition_type)
    transition_angle=$(random_angle)
    random_time=$(random_time)
    swww img "$selected_wallpaper" --transition-type "$transition_type" --transition-angle "$transition_angle" --transition-fps 100 --transition-duration "$random_time"

    wal -i "$selected_wallpaper" -n --cols16
    swaync-client --reload-css
    cat ~/.cache/wal/colors-kitty.conf > ~/.config/kitty/current-theme.conf
    pywalfox update

    color1=$(awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
    color2=$(awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)

    # Update cava config with colors
    cava_config="$HOME/.config/cava/config"
    sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
    sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config

    # Update btop theme config with the two main colors
    btop_theme="$HOME/.config/btop/themes/custom.theme"
    sed -i "s/#color1=.*/#color1=$color1/" $btop_theme
    sed -i "s/#color2=.*/#color2=$color2/" $btop_theme

    # Send USR2 signal to restart cava
    pkill -USR2 cava 2>/dev/null

    # Set up colors and copy wallpaper
    source ~/.cache/wal/colors.sh && cp -r $wallpaper ~/wallpapers/pywallpaper.jpg
}

main
