#!/bin/bash

sudo pacman -S libx11 libxft xorg-server xorg-xinit xorg-xsetroot ttf-ibm-plex

mkdir ~/.build
cd ~/.build

git clone git://git.suckless.org/st
git clone git://git.suckless.org/dmenu
git clone git://git.suckless.org/dwm

git clone https://github.com/dib-a/dwm-config

sh update-configs.sh
