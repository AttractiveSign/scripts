#! /bin/bash
export HYPRLAND_INSTANCE_SIGNATURE=$(ls /run/user/1000/hypr/ | head -n 1)
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
DIR="${HOME}/Pictures/wallpapers"
CACHE_FILE="${HOME}/.cache/last_wallpaper"

if [[ -d "${DIR}" ]]; then
    files=($(ls "${DIR}"))
else
    exit 1
fi

if [[ -f "${CACHE_FILE}" ]]; then
    last_wallpaper=$(<"${CACHE_FILE}")
else 
    last_wallpaper=""
fi

while true; do
    random_file=${files[RANDOM % ${#files[@]}]}
    [[ "$random_file" != "$last_wallpaper" ]] && break
done

echo "${random_file}" > "${CACHE_FILE}"

hyprctl hyprpaper reload ,"${DIR}/${random_file}" 
notify-send "Wallpaper changed"
