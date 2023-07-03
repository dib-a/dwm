#!/bin/bash

sudo pacman -S --noconfirm libx11 libxft libxinerama xorg-server xorg-xinit xorg-xsetroot ttf-fira-code >/dev/null 2>&1

mkdir -p /opt/dwm
cd /opt/dwm

suckless() {
    echo "--------------------------------------------------"
    echo "DWM is currently being installed. Please wait..."
    echo "--------------------------------------------------"
    git clone git://git.suckless.org/dwm >/dev/null 2>&1
    git clone git://git.suckless.org/dmenu >/dev/null 2>&1
    # git clone git://git.suckless.org/st

    cd dwm
    sudo make clean install >/dev/null 2>&1
    
    # cd ../st
    # sudo make clean install

    cd ../dmenu
    sudo make clean install >/dev/null 2>&1
}

directories() {
    sh /opt/dwm/directories.sh
    cp /opt/dwm/img/tree.jpg /home/$USER/media/wallpapers/tree.jpg
}

customization() {
    read -p "Do you want to add dib-a customizations? (y/n): " choice

    if [ "$choice" == "y" ]; then
        echo "Adding customizations..."
        sh /opt/dwm/update.sh
        cp /opt/dwm/img/tree.jpg /home/$USER/media/wallpapers/tree.jpg
    else
        echo "Skipping customization."
    fi

    rm /home/$USER/.xinitrc
    cp /opt/dwm/xinitrc /home/$USER/.xinitrc

    directories
}

suckless
customization
