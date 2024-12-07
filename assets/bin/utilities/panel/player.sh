#!/bin/sh

bar_pid=$(pgrep -a "polybar" | cut -d" " -f1)
players="spotify,%any,firefox,chromium,brave,mpd"
player_status=$(playerctl -p $players status)
script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
exit=$?

update_hooks () {
    while IFS= read -r id; do
      polybar-msg -p "$id" hook music-play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

scroll () {
  zscroll -l 20 \
          --delay 1 \
          --scroll-padding " | " \
          --match-command "$script_dir/player.sh scroll-music" \
          --match-text "Playing" "--scroll 1" \
          --match-text "Paused" "--scroll 0" \
          --update-check true "$script_dir/player.sh" &
  wait
}

if [[ "$1" == "scroll-music" ]]; then
  echo $player_status
else
  if [ "$player_status" == "Stopped" ]; then
    echo "Offline"
  elif [ "$player_status" == "Paused"  ]; then
    update_hooks "$bar_pid" 2
    playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
  elif [ "$player_status" == "Offline"  ]; then
    echo $player_status
  else
    update_hooks "$bar_pid" 1
    playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
  fi
fi


case $1 in
  scroll-toggle)
    scroll
  ;;
  next)
    playerctl -p $players next
  ;;
  previous)
    playerctl -p $players previous
  ;;
  toggle)
    playerctl -p $players play-pause
  ;;
  spotify-ctl)
    if [ -z "$(pgrep spotify)" ]; then
      spotify &
      sleep 1
    fi
    playerctl -p spotify play-pause
  ;;
  spotify-move)
    spotify_status=$(pgrep spotify)
    if [ -z "$(pgrep spotify)" ]; then
      spotify &
    else
      wmctrl -x -R "Spotify"
    fi
  ;;
esac
