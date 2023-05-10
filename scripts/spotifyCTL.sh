SPOTIFY_PGREP=$(pgrep spotify | wc -l)

if [[ $1 == "ctl" ]]; then
    if [[ $SPOTIFY_PGREP -eq 1 ]]; then
        spotify &
        sleep 2
    fi
    spotifyctl -q playpause
elif [[ $1 == "move" ]]; then
    if [[ $SPOTIFY_PGREP -gt 1 ]]; then
        wmctrl -x -R "Spotify"
    else
        spotify &
    fi
elif [[ $1 == "title" ]]; then
    title=$(spotifyctl -q status --format '%title%' | cut -d'(' -f1)
    echo "$title"
else
    echo Spotify
fi

