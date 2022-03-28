#!/bin/bash
cd suckless/dwm
rm config.h
rm variables.h
cp ../../config.h config.h
cp ../../variables.h variables.h
sudo make clean install
