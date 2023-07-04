#!/bin/bash

sudo pacman -S --noconfirm libx11 libxft libxinerama xorg-server xorg-xinit xorg-xsetroot ttf-fira-code ttf-font-awesome >/dev/null 2>&1

mkdir -p /opt/dwm
cd /opt/dwm

suckless() {
    echo "--------------------------------------------------"
    echo "DWM is currently being installed. Please wait..."
    echo "--------------------------------------------------"
    sudo git clone git://git.suckless.org/dwm #>/dev/null 2>&1
    sudo git clone git://git.suckless.org/dmenu #>/dev/null 2>&1
    # git clone git://git.suckless.org/st

    cd /opt/dwm/dwm
    sudo make clean install >/dev/null 2>&1
    
    # cd ../st
    # sudo make clean install

    cd /opt/dwm/dmenu
    sudo make clean install >/dev/null 2>&1
}

directories() {
    sh /opt/dwm/directories.sh
    cp /opt/dwm/img/tree.jpg /home/$USER/media/wallpapers/tree.jpg
}

customization() {
    read -p "Do you want to add dib-a customizations? (y/n): " choice

    directories

    if [ "$choice" == "y" ]; then
        echo "Adding customizations..."
        sh /opt/dwm/update.sh
        cp /opt/dwm/img/tree.jpg /home/$USER/media/wallpapers/tree.jpg
    else
        echo "Skipping customization."
    fi

    if [ -f /home/$USER/.xinitrc ]; then
        rm /home/$USER/.xinitrc
    fi

    cp /opt/dwm/xinitrc /home/$USER/.xinitrc
}

suckless
customization
