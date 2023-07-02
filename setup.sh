#!/bin/bash

sudo pacman -S libx11 libxft libxinerama xorg-server xorg-xinit xorg-xsetroot ttf-fira-code

mkdir -p /opt/dwm
cd /opt/dwm

git clone git://git.suckless.org/dwm
git clone git://git.suckless.org/dmenu
# git clone git://git.suckless.org/st

cd dwm
sudo make clean install

cd ../dmenu
sudo make clean install

# cd ../st
# sudo make clean install

read -p "Do you want to add dib-a customizations? (y/n): " choice

if [ "$choice" == "y" ]; then
    echo "Adding customizations..."
    sh /opt/dwm/update.sh
else
    echo "Skipping customization."
fi

rm /home/$USER/.xinitrc
cp /opt/dwm/xinitrc /home/$USER/.xinitrc
