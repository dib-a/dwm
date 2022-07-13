path=$(cd pwd)

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama ttf-ibm-plex feh

cd src
mkdir suckless
cd suckless
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
cd dmenu
sudo make clean install
$path
cd src
sudo chmod -R 755 suckless
cd scripts
sh all.sh
