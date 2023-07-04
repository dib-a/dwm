#!/bin/bash

cd /opt/dwm

remove_if_exists() {
    local path="$1"
    if [ -f "$path" ]; then
        sudo rm "$path"
    fi

    if [ -d "$path" ]; then
        sudo rm -r "$path"
    fi
}

remove_if_exists "/opt/dwm/dwm/config.h"
remove_if_exists "/opt/dwm/dwm/variables.h"
#sudo rm st/config.h
#sudo rm st/variables.h

cp /opt/dwm/dwm.h /opt/dwm/dwm/config.h
#cp st.h st/config.h
cp /opt/dwm/variables.h /opt/dwm/dwm/variables.h
#cp variables.h st/variables.h

cd /opt/dwm/dwm
sudo make clean install

cd /opt/dwm/dmenu
sudo make clean install

#cd ../st
#sudo make clean install
