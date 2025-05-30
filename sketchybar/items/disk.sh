#!/bin/bash

disk=(
  padding_right=8
  icon=$ICON_DISK
  icon.color=$BLUE
  icon.padding_right=0
  label.width=30
  label.align=right
  label.padding_left=0
  script="$PLUGIN_DIR/disk.sh"
)

sketchybar --add item disk left \
     --set disk "${disk[@]}" \
	   --subscribe disk system_woke
