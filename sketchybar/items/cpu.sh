#!/bin/bash

cpu_percent=(
  padding_left=8
  icon=$ICON_CPU
  icon.color=$RED
  label=CPU
  label.width=35
  label.align=right
  update_freq=2
  mach_helper="$HELPER"
)

sketchybar --add item cpu.percent left \
           --set cpu.percent "${cpu_percent[@]}" 
