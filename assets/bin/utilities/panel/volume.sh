#!/bin/sh
volume() {
  # headphone 󰋋
  # SOURCE=$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | sed -n 's/.*node.description = "\(.*\)"/\1/p')
  # SINK=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | sed -n 's/.*node.description = "\(.*\)"/\1/p')
  VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed -n 's/^Volume: \(0.\|..\)//p')
  IS_MUTED=$(echo ${VOLUME} | grep "MUTED")

  action=$1
  if [ "${action}" == "up" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
  elif [ "${action}" == "down" ]; then
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
  elif [ "${action}" == "mute" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  else
    if [ -n "${IS_MUTED}" ]; then
      echo " ${SOURCE}| 󰖁  MUTED${SINK}"
    else
      echo " ${SOURCE}|   ${VOLUME}%${SINK}"
    fi
  fi
}

volume "$@"
