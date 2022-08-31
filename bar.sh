get_date() {
    DATE="$(date "+%a %d-%m-%y %T")"
    printf "%s" "[  $DATE ]"
}

get_backlight() {
	LIGHT_ACT="$(cat /sys/class/backlight/intel_backlight/actual_brightness)"
	LIGHT_MAX="$(cat /sys/class/backlight/intel_backlight/max_brightness)"

	LIGHT_PER="$(($LIGHT_ACT*100/$LIGHT_MAX))"
	
       	printf "%s" "[  $LIGHT_PER% ]"
}

get_battery() {
   BAT_PER="$(cat /sys/class/power_supply/BAT0/capacity)"
   BAT_STAT="$(cat /sys/class/power_supply/BAT0/status)"
   if [[ $BAT_PER -le 25 && $BAT_STAT == Charging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 25 && $BAT_STAT == Discharging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 50 && $BAT_STAT == Charging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 50 && $BAT_STAT == Discharging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 75 && $BAT_STAT == Charging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 75 && $BAT_STAT == Discharging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -eq 100 && $BAT_STAT == Charging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -eq 100 && $BAT_STAT == Discharging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 100 && $BAT_STAT == Charging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ $BAT_PER -le 100 && $BAT_STAT == Discharging ]]; then
       printf "%s" "[  $BAT_PER% ]"
       break
   elif [[ 0 -eq 0 ]]; then
       printf "%s" "[ $BAT_PER% ]"
       break
   fi
}

get_ram() {
    RAM="$(free -mh --si | awk  {'print $2'} | head -n 2 | tail -1)"
    USED="$(free -mh --si | awk  {'print $3'} | head -n 2 | tail -1)"
    printf "[  $USED/$RAM ]"
}

get_volume() {
    VOL="$(pactl get-sink-volume @DEFAULT_SINK@ | tail -n 2 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -n 1)"
    printf "[  $VOL ]"
}

get_wifi() {
    WIFI="$(grep "^\s*w" /proc/net/wireless | awk '{ print "", int($3 * 100 / 70)}'| xargs)"
    printf "[  $WIFI ]"
}
while true
do
	xsetroot -name " $(get_wifi)$(get_ram)$(get_backlight)$(get_volume)$(get_battery)$(get_date)"
    	#xsetroot -name "$(get_volume) $(get_ram) $(get_date)"
    	sleep 1
done
