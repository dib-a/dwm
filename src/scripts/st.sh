#!/bin/bash
cd ../suckless/st
rm config.h
rm variables.h
cp ../../configs/st.h config.h
cp ../../configs/variables.h variables.h
sudo make clean install
