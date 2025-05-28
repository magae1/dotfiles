#!/bin/bash

caffe=(
  icon=
  icon.font="Hack Nerd Font:Bold:16.0"
  script="$PLUGIN_DIR/caffeinate.sh"
  click_script="$PLUGIN_DIR/caffeinate.sh"
)

sketchybar --add item caffeinate right \
	   --set caffeinate "${caffe[@]}" 
