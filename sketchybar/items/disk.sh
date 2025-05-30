#!/bin/bash

disk=(
  padding_right=8
  icon=$ICON_DISK
  icon.color=$BLUE
  label.width=35
  label.align=right
  script="$PLUGIN_DIR/disk.sh"
)

sketchybar --add item disk left \
     --set disk "${disk[@]}" \
	   --subscribe disk system_woke
