#!/bin/bash

cd ~/.build

rm dwm/config.h
rm dwm/variables.h
rm st/config.h
rm st/variables.h

cp dwm-config/dwm.h dwm/config.h
cp dwm-config/st.h st/config.h
cp dwm-config/variables.h dwm/variables.h
cp dwm-config/variables.h st/variables.h

cd dwm
sudo make clean install
cd ../st
sudo make clean install
