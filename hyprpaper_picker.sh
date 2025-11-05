#! /bin/bash
export HYPRLAND_INSTANCE_SIGNATURE=$(ls /run/user/1000/hypr/ | head -n 1)
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
DIR="${HOME}/Pictures/wallpapers"

if [[ -d "${DIR}" ]]; then
    files=($(ls "${DIR}"))
    random_file=${files[RANDOM % ${#files[@]}]}
fi
hyprctl hyprpaper reload ,"${DIR}/${random_file}" 
notify-send "Wallpaper changed"
