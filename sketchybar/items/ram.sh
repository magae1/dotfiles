#!/bin/bash

ram=(
  icon=$ICON_RAM
  icon.color=$GREEN
  icon.padding_right=0
  label.width=30
  label.align=right
  label.padding_left=0
  update_freq=15
  script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item ram left \
	   --set ram "${ram[@]}"
