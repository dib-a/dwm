while true
do
    sh /opt/dwm/bar.sh
    sleep 1 
done &

picom -b &

feh --bg-scale ~/media/wallpapers/tree.jpg &

exec dwm
