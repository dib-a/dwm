#!/bin/bash

cd /opt/dwm

sudo rm dwm/config.h
sudo rm dwm/variables.h
#sudo rm st/config.h
#sudo rm st/variables.h

cp dwm.h dwm/config.h
#cp st.h st/config.h
cp variables.h dwm/variables.h
#cp variables.h st/variables.h

cd dwm
sudo make clean install
#cd ../st
#sudo make clean install
