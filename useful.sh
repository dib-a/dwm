#!/bin/bash
sudo pacman -S inkscape gimp okular ranger neofetch htop geogebra mpv xournalpp xf86-input-wacom

cd /opt
mkdir fonts
cd fonts

git clone https://aur.archlinux.org/ttf-qurancomplex-fonts.git
cd ttf-qurancomplex-fonts
makepkg -si

cd /opt/fonts

git clone https://aur.archlinux.org/ttf-poppins.git
cd ttf-poppins
makepkg -si
