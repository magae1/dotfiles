#!/bin/bash

calendar=(
  padding_right=8
  padding_left=8
  icon=cal
  icon.font="$FONT:Semibold:12.0"
  icon.padding_right=0
  label.font="$FONT:Bold:14.0"
  label.width=45
  label.align=right
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke \
	   --add bracket bracket.calendar calendar \
	   --set bracket.calendar "${bracket[@]}"
