#!/bin/bash
cd ../suckless/dwm
rm config.h
rm variables.h
cp ../../configs/config_dwm.h config.h
cp ../../configs/variables.h variables.h
sudo make clean install
