#!/bin/bash
cd suckless/st
rm config.h
rm variables.h
cp ../../config_st.h config.h
cp ../../variables.h variables.h
sudo make clean install
