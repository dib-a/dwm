#!/bin/bash

pacman -S xorg-xinit xorg-xserver libx11 libxft gnu-free-fonts

# clone all needed repos
git clone git://git.suckless.org/dwm
git clone git://git.suckless.org/st
git clone git://git.suckless.org/dmenu

cd st
sudo make clean install
cd dmenu
sudo make clean install
cd dwm
sudo make clean install

echo exec dwm > ~/.xinitrc 

startx
