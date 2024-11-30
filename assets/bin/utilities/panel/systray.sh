#!/bin/sh
polybar () {
  hidden=/tmp/polytray.lock
  if [[ $(pidof stalonetray) ]]; then
    if [[ ! -e $hidden ]]; then
      polybar-msg action "#tray.hook.1"
      xdo hide -n stalonetray
      touch "$hidden"
    else
      polybar-msg action "#tray.hook.0"
      xdo show -n stalonetray
      xdo raise -n stalonetray
      rm "$hidden"
    fi
  else
    stalonetray -c $HOME/.config/polybar/stalonetrayrc &
  fi
}

polybar
