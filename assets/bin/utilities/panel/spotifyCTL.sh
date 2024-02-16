TITLE_END=50
SPOTIFY_PGREP=$(pgrep spotify | wc -l)

if [[ $1 == "ctl" ]]; then
  if [[ $SPOTIFY_PGREP -eq 0 ]]; then
    spotify &
    sleep 2
  fi
  playerctl -p spotify play-pause
elif [[ $1 == "move" ]]; then
  if [[ $SPOTIFY_PGREP -gt 1 ]]; then
    wmctrl -x -R "Spotify"
  else
    spotify &
  fi
elif [[ $1 == "title" ]]; then
  title=$(spotifyctl -q status --format '%title%')
  if [ ${#title} -gt $TITLE_END ]; then
    title="$(echo "$title" | cut -d'(' -f1 | cut -c-$TITLE_END)..."
  fi
  echo "$title"
else
  echo Spotify
fi

