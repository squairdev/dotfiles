#!/bin/bash

echo -e "\e[34mWelcome to Squair's dotfiles installer!\nThis will take a while, so be patient.\e[0m"

main() {
    echo -e "\e[34mInstalling dotfiles...\e[0m"

    if command -v git &>/dev/null; then
        echo -e "\e[32mGit is already installed.\e[0m"
    else
        echo -e "\e[34mInstalling git...\e[0m"
        sudo pacman -S git --noconfirm
        echo -e "\e[32mGit installed.\e[0m"
    fi

    #clone dots
    echo -e "\e[34mDownloading dotfiles...\e[0m"
    git clone https://github.com/squairdev/dotfiles.git "$USER_HOME/.config/squairdots/dotfiles"

    #copy dots
    echo -e "\e[34mCopying dotfiles...\e[0m"
    cp -r "$USER_HOME/.config/squairdots/dotfiles/.config/." "$USER_HOME/.config/"
    echo -e "\e[32mDotfiles copied.\e[0m"

    #long install processs
    echo -e "\e[34mInstalling packages. This will take a while...\e[0m"
    
    #yay! literally
    echo -e "\e[34mInstalling yay and AUR packages...\e[0m"
    sudo pacman -S --needed base-devel git --noconfirm

    if ! command -v yay &>/dev/null; then
        git clone https://aur.archlinux.org/yay.git "$USER_HOME/.config/squairdots/dotfiles/yay"
        chown -R "$SUDO_USER":"$SUDO_USER" "$USER_HOME/.config/squairdots/dotfiles/yay"
        sudo -u "$SUDO_USER" bash -c "cd '$USER_HOME/.config/squairdots/dotfiles/yay' && makepkg -si --noconfirm"
        rm -rf "$USER_HOME/.config/squairdots/dotfiles/yay"
    else
        echo -e "\e[32mYay is already installed.\e[0m"
    fi
    bash -c "yay -S --noconfirm --needed pywal ashell"
    echo -e "\e[32mYay Packages installed.\e[0m"
    
    #pacman packages
    sudo pacman -S - < $USER_HOME/.config/squairdots/dotfiles/packages.txt --noconfirm --needed
    echo -e "\e[32mPacman Packages installed.\e[0m"

    #pip packages
    pip install -r $USER_HOME/.config/squairdots/dotfiles/packages-pip.txt --break-system-packages #trust me, you'll be fine
    echo -e "\e[32mPip Packages installed.\e[0m"

    #walls
    echo -e "\e[34mCopying wallpapers...\e[0m"
    mkdir -p "$USER_HOME/wallpapers/walls"
    cp -r "$USER_HOME/.config/squairdots/dotfiles/wallpapers/." "$USER_HOME/wallpapers/walls"
    cp "$USER_HOME/.config/squairdots/dotfiles/wallpapers/trees.jpg" "$USER_HOME/wallpapers/pywallpaper.jpg"
    echo -e "\e[32mWallpapers copied.\e[0m"

    #nwg
    echo -e "\e[34mCopying additional images...\e[0m"
    sudo cp -r "$USER_HOME/.config/squairdots/dotfiles/images/grid.svg" "/usr/share/nwg-dock-hyprland/images/grid.svg"


    echo -e "\e[34mInstallation complete!\nRestart your computer to apply changes.\e[0m"
    echo -e "\e[31mIf you run 'hyprland' and the command can't be found, re-run this script.\e[0m"
    exit 0



}


#wow main
echo -e "\e[31mThis script does a full install. There is no manual install... yet.\e[0m"
read -r -e -p "Do you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        USER_HOME=$(eval echo "~$SUDO_USER")

        mkdir -p "$USER_HOME/.config/squairdots"

        cd "$USER_HOME/.config/squairdots" || exit 1
        main
        ;;
    *)
        echo -e "\e[31mExiting...\e[0m"
        exit 1
        ;;
esac