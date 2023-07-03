#!/bin/bash

cd /opt/dwm

remove_if_exists() {
    local path="$1"
    if [ -f "$path" ]; then
        rm "$path"
    fi

    if [ -d "$path" ]; then
        rm -r "$path"
    fi
}

sudo remove_if_exists "dwm/config.h"
sudo remove_if_exists "dwm/variables.h"
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
