sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama ttf-ibm-plex ttf-font-awesome feh

git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st

cd dmenu
sudo make clean install
cd ../dwm
sudo make clean install
cd ../st
sudo make clean install
