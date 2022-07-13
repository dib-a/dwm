#!/bin/bash
sudo pacman -S pulseaudio pulsemixer inkscape gimp okular ranger neofetch htop geogebra mpv xournalpp xf86-input-wacom keepassxc ntfs-3g telegram-desktop syncthing

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
