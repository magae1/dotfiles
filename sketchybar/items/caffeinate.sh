#!/bin/bash

caffe=(
  icon=
  icon.font="Hack Nerd Font:Bold:16.0"
  icon.padding_left=8
  icon.padding_right=8
  background.drawing=off
  label.drawing=off
  script="$PLUGIN_DIR/caffeinate.sh"
  click_script="$PLUGIN_DIR/caffeinate.sh"
)

sketchybar --add item caffeinate left		\
	   --set caffeinate "${caffe[@]}"	\
						\
	   --add bracket bracket.caffeinate caffeinate \
	   --set bracket.caffeinate "${bracket[@]}" 
