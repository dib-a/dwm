MY_PATH=$(cd "$MY_PATH" && pwd)

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama firefox ttf-font-awesome feh

mkdir suckless
cd suckless
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
cd dmenu
sudo make clean install
cd $MY_PATH
sudo chmod -R 755 suckless
cd scripts
sh all.sh
