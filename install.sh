mkdir suckless
cd suckless
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmeu
git clone https://git.suckless.org/st
cd st
sudo make clean install
cd ../dmenu
sudo make clean install
cd ..
sh ../update.sh
