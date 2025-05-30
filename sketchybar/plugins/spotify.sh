#!/bin/bash

play () {
  osascript -e 'tell application "Spotify" to playpause'
}

update () {
  source "$HOME/.config/sketchybar/icons.sh"

  PLAYING=1
  if [ "$(echo "$INFO" | jq -r '.["Player State"]')" = "Playing" ]; then
    PLAYING=0
    TRACK="$(echo "$INFO" | jq -r .Name | sed 's/\(.\{20\}\).*/\1.../')"
    ARTIST="$(echo "$INFO" | jq -r .Artist | sed 's/\(.\{20\}\).*/\1.../')"
    ALBUM="$(echo "$INFO" | jq -r .Album | sed 's/\(.\{25\}\).*/\1.../')"
    COVER=$(osascript -e 'tell application "Spotify" to get artwork url of current track')
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    curl -s --max-time 20 "$COVER" -o /tmp/cover.jpg
    if [ "$ARTIST" == "" ]; then
      args+=(--set spotify.title label="$TRACK"
             --set spotify.artist label="$ALBUM"  )
    else
      args+=(--set spotify.title label="$TRACK"
             --set spotify.artist label="$ARTIST")
    fi
    args+=(--set spotify.play icon=$SPOTIFY_PAUSE
           --set spotify.cover background.image="/tmp/cover.jpg"
                               background.color=0x00000000 )
  else
    args+=(--set spotify.play icon=$SPOTIFY_PLAY )
  fi
  sketchybar -m "${args[@]}"
}

mouse_clicked () {
  case "$NAME" in
    "spotify.play") play
    ;;
    *) exit
    ;;
  esac
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
