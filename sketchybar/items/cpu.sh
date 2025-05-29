#!/bin/bash

cpu_top=(
  label.font="$FONT:Semibold:7"
  label=CPU
  icon.drawing=off
  width=0
  padding_right=15
  y_offset=6
)

cpu_percent=(
  icon=$ICON_CPU
  icon.color=$RED
  icon.font="$FONT:Bold:16.0"
  label.font="$FONT:Heavy:12.0"
  label=CPU
  label.width=35
  label.align=right
  update_freq=2
  mach_helper="$HELPER"
)

cpu_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=$RED
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=on
  background.color=$TRANSPARENT
)

cpu_user=(
  graph.color=$BLUE
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=on
  background.color=$TRANSPARENT
)

sketchybar --add item cpu.percent left           \
           --set cpu.percent "${cpu_percent[@]}" 
