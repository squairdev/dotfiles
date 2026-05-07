#!/bin/bash
yayi(){
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    main
}

main(){
    echo -e "\e[0minstalling pacman packages"
    if sudo pacman -S git hyprland hyprlock waybar awww wofi dunst python-pip cava btop playerctl pipewire-pulse hyprshot kitty --needed --noconfirm; then
        echo "pacman packages installed"
    else
        echo "There was an error installing the pacman packages. Please view the error above."
        exit
    fi
    pkgsp=(pywalfox haishoku)
    for pkg in "${pkgsp[@]}"; do
        if ! pip show "$pkg" &> /dev/null; then
            pip install "$pkg" --break-system-packages #no, this wont break anything 
        fi
    done
    pywalfox install
    pkgsy=(python-pywal wlogout)
    for pkg in "${pkgsy[@]}"; do
        if ! yay -Qi "$pkg" &> /dev/null; then
            yay -S --needed --noconfirm "$pkg"
        fi
    done
    echo "yay packages installed"
    echo "downloading dotfiles"
    git clone https://github.com/squairdev/dotfiles.git
    echo "installing dotfiles"
    mkdir -p ~/.config
    cp -r dotfiles/config/.config/ ~/ 
    sudo cp -r dotfiles/config/bin/swal /bin/swal
    rm -f .cache/current_wallpaper
    mv dotfiles/config/img/walStartup.png ~/.cache/walStartup.png
    sudo chmod +x ~/.config/hypr/bonjour.sh
    ende
}

ende(){
    echo -e "\e[0;32mdotfiles successfully installed."
    echo -e "thanks for chosing my dotfiles!\e[0m"
    read -p "cleanup and delete folders? [y/n]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf yay dotfiles
    else
        echo "done"
    fi
}

echo -e "\e[0;34mSquair's dotfiles"
echo -e "Note: some steps require you to enter your sudo password.\e[0;31m"
read -p "[!] WARNING: THIS INSTALL SCRIPT IS STILL VERY EXPERIMENTAL AND DOES A FULL INSTALL. PROCEED? [y/n]:" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if pacman -Qi yay &> /dev/null; then
        main
    else
        yayi
    fi
else
    echo -e "\e[0mdone"
    exit
fi