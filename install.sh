#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo -e "\e[31mThis script must be run as root.\e[0m" 1>&2
    exit 1
fi

echo -e "\e[34mWelcome to Squair's dotfiles installer!\nThis will take a while, so be patient.\e[0m"

main() {
    echo -e "\e[34mInstalling dotfiles...\e[0m"

    if command -v git &>/dev/null; then
        echo -e "\e[32mGit is already installed.\e[0m"
    else
        echo -e "\e[34mInstalling git...\e[0m"
        pacman -S git --noconfirm
        echo -e "\e[32mGit installed.\e[0m"
    fi

    #clone dots
    echo -e "\e[34mDownloading dotfiles...\e[0m"
    sudo -u "$SUDO_USER" git clone https://github.com/squairdev/dotfiles.git "$USER_HOME/.config/squairdots/dotfiles"

    #copy dots
    echo -e "\e[34mCopying dotfiles...\e[0m"
    sudo -u "$SUDO_USER" cp -r "$USER_HOME/.config/squairdots/dotfiles/.config/." "$USER_HOME/.config/"
    echo -e "\e[32mDotfiles copied.\e[0m"

    #long install processs
    echo -e "\e[34mInstalling packages. This will take a while...\e[0m"
    
    #yay! literally
    pacman -S --needed base-devel
    sudo -u "$SUDO_USER" git clone https://aur.archlinux.org/yay.git "$USER_HOME/.config/squairdots/dotfiles/yay"
    cd "$USER_HOME/.config/squairdots/dotfiles/yay"
    sudo -u "$SUDO_USER" makepkg -si --noconfirm
    cd "$USER_HOME/.config/squairdots/dotfiles"
    rm -rf "$USER_HOME/.config/squairdots/dotfiles/yay"
    yay --version
    
    #pacman packages
    pacman -S - < $USER_HOME/.config/squairdots/dotfiles/packages.txt --noconfirm --needed
    echo -e "\e[32mPacman Packages installed.\e[0m"
    
    #yay packages
    sudo -u "$SUDO_USER" yay -S - < $USER_HOME/.config/squairdots/dotfiles/packages-yay.txt --noconfirm --needed
    echo -e "\e[32mYay Packages installed.\e[0m"

    #pip packages
    python3 -m venv pipinstallvm
    source pipinstallvm/bin/activate
    pip install -r $USER_HOME/.config/squairdots/dotfiles/packages-pip.txt
    rm -rf pipinstallvm
    echo -e "\e[32mPip Packages installed.\e[0m"

    #walls
    echo -e "\e[34mCopying wallpapers...\e[0m"
    sudo -u "$SUDO_USER" mkdir -p "$USER_HOME/wallpapers/walls"
    sudo -u "$SUDO_USER" cp -r "$USER_HOME/.config/squairdots/dotfiles/wallpapers/." "$USER_HOME/wallpapers/walls"
    echo -e "\e[32mWallpapers copied.\e[0m"
    echo -e "\e[34mInstallation complete!\nRestart your computer to apply changes.\e[0m"
    exit 0



}


#wow main
echo -e "\e[31mThis script does a full install. There is no manual install... yet.\e[0m"
read -r -e -p "Do you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        USER_HOME=$(eval echo "~$SUDO_USER")

        sudo -u "$SUDO_USER" mkdir -p "$USER_HOME/.config/squairdots"

        cd "$USER_HOME/.config/squairdots" || exit 1
        main
        ;;
    *)
        echo -e "\e[31mExiting...\e[0m"
        exit 1
        ;;
esac