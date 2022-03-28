MY_PATH=$(cd "$MY_PATH" && pwd)

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot

mkdir suckless
cd suckless
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
cd dmenu
sudo make clean install
cd $MY_PATH
sudo chmod -R 755 suckless
sh update_dwm.sh
sh update_st.sh
