get_date() {
    DATE="$(date "+%a %d-%m-%y %T")"
    printf "%s" "[  $DATE ]"
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

while true
do
    xsetroot -name "$(get_battery)$(get_date)"
    sleep 1
done
