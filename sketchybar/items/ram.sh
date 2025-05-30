#!/bin/bash

ram=(
  icon=$ICON_RAM
  icon.color=$GREEN
  label.width=35
  label.align=right
  update_freq=15
  script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item ram left \
	   --set ram "${ram[@]}"
