#!/bin/bash

cpu_percent=(
  padding_left=8
  icon=$ICON_CPU
  icon.color=$RED
  icon.padding_right=0
  label=CPU
  label.width=30
  label.align=right
  label.padding_left=0
  update_freq=2
  mach_helper="$HELPER"
)

sketchybar --add item cpu.percent left \
           --set cpu.percent "${cpu_percent[@]}" 
