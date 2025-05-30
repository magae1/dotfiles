#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

spotify_play=(
  icon=$SPOTIFY_PLAY
  icon.width=24
  icon.align=center
  label.drawing=off
  updates=on
  script="$PLUGIN_DIR/spotify.sh"
)

spotify_cover=(
  width=36
  icon.drawing=off
  label.drawing=off
  background.color=$GREY
  background.height=36
  background.padding_left=0
  background.image.drawing=on
  background.image.scale=0.055
  background.image.corner_radius=9
  click_script="open -a 'Spotify'"
)

spotify_artist=(
  padding_left=0
  padding_right=8
  y_offset=7
  label.font="SF Pro:SemiBold:8.0"
  click_script="open -a 'Spotify'"
)

spotify_title=(
  padding_left=0
  padding_right=8
  y_offset=-5
  label.font="SF Pro:Bold:11.5"
  background.padding_left=-40
  click_script="open -a 'Spotify'"
)


sketchybar --add event spotify_change $SPOTIFY_EVENT	\
							\
	   --add item spotify.cover left                \
           --set spotify.cover "${spotify_cover[@]}"    \
							\
	   --add item spotify.play left			\
	   --set spotify.play "${spotify_play[@]}"	\
	   --subscribe spotify.play mouse.clicked	\
				    spotify_change	\
							\
	   --add item spotify.artist left		\
	   --set spotify.artist "${spotify_artist[@]}"	\
							\
	   --add item spotify.title left		\
	   --set spotify.title "${spotify_title[@]}"	\
							\
	   --add bracket spotify spotify.play		\
				 spotify.cover		\
				 spotify.artist		\
				 spotify.title		\
	   --set spotify "${bracket[@]}"
