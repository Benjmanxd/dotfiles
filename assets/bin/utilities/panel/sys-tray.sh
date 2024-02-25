#!/bin/bash

hidden=/tmp/polytray.lock

polybar () {
    config="$HOME/.config/polybar/module.ini"

    if [[ $(pidof stalonetray) ]]; then
        if [[ ! -e $hidden ]]; then
            polybar-msg action "#tray.hook.1"
            xdo hide -n stalonetray
            touch "$hidden"
            sed -i 's/tray\ninitial=.*/tray\ninitial=2/g' "$config"
        else
            polybar-msg action "#tray.hook.0"
            xdo show -n stalonetray
            xdo raise -n stalonetray
            rm "$hidden"
            sed -i 's/tray\ninitial=.*/tray\ninitial=1/g' "$config"
        fi
    else
        stalonetray -c $HOME/.config/polybar/stalonetrayrc &
    fi
}

eww () {
    if [[ $(pidof stalonetray) ]]; then
        if [[ ! -e $hidden ]]; then
            xdo hide -n stalonetray
            touch "$hidden"
        else
            xdo show -n stalonetray
            xdo raise -n stalonetray
            rm "$hidden"
        fi
    else
        stalonetray -c $HOME/.config/polybar/stalonetrayrc &
    fi
}

case $1 in
    polybar)
        polybar
    ;;
    eww)
        eww
    ;;
    eww-check)
        [[ ! -e $hidden ]] && echo "On" || echo "Off"
    ;;
esac
