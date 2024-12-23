#!/bin/sh

config=~/.config/rofi/power.rasi
# script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

shutdown="⏻"
reboot="󰑐"
lock=""
suspend="󰤄"
logout="󰍃"

# sh "$script_dir/accent.sh"

chosen="$(printf "%s\n%s\n%s\n%s\n%s\n" "$shutdown" "$reboot" "$lock" "$suspend" "$logout" | rofi -theme "$config" -p "$(uptime -p)" -dmenu -kb-cancel Alt-F1 -selected-row 2)"

execute () {
  yad --title "Are you sure you want to $2?" --button "Yes":0 --button "No":1 --buttons-layout center --center --on-top --fixed --no_escape
  exit=$?

  if [ "$exit" -eq 0 ]; then
    $1
  fi
}

case "$chosen" in
  "$shutdown")
    execute "shutdown -h now" "shutdown"
  ;;
  "$reboot")
    execute "reboot -h now" "reboot"
  ;;
  "$lock")
    sh "~/.config/assets/bin/utilities/lockscreen.sh"
  ;;
  "$suspend")
    execute "playerctl -a stop && sudo systemctl suspend"
  ;;
  "$logout")
    execute "kill -9 -1" "quit"
  ;;
esac
