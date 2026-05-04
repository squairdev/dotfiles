#!/bin/bash
yayi(){
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    main
}

main(){
    echo "installing pacman packages"
    if sudo pacman -S git hyprland hyprlock waybar wofi dunst python-pip cava btop playerctl pipewire-pulse hyprshot kitty --needed --noconfirm; then
        echo "pacman packages installed"
    else
        echo "There was an error installing the pacman packages. Please view the error above."
        exit
    fi
    if pip show haishoku &> /dev/null; then
        echo "pip packages installed"
    else
        pip install haishoku --break-system-packages #no, this wont break anything 
        exit
    fi
    if yay -Qi python-pywal &> /dev/null; then
        echo "done wal"
    else
        yay -S --needed --noconfirm pywal
    fi awww
    if yay -Qi awww-git &> /dev/null; then
        echo "done awww"
    else
        yay -S --needed --noconfirm awww-git
    fi
    echo "yay packages installed"
    echo "downloading dotfiles"
    git clone https://github.com/squairdev/dotfiles.git
    echo "installing dotfiles"
    cd dotfiles
    mkdir -p ~/.config
    cp -r config/.config/ ~/.config/ 
    cd ..
    sudo cp -r config/bin/swal /bin/swal
    ende
}

ende(){
    echo "dotfiles successfully installed."
    echo "thanks for chosing my dotfiles!"
    read -p "cleanup and delete folders? [y/n]: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf yay dotfiles
    else
        echo "done"
    fi
}

echo "Squairdev's dotfiles"
echo "Note: some steps require you to enter your sudo password."
read -p "[!] WARNING: THIS INSTALL SCRIPT IS STILL VERY EXPERIMENTAL. PROCEED? [y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if pacman -Qi yay &> /dev/null; then
        main
    else
        yayi
    fi
else
    exit
fi

echo "done"