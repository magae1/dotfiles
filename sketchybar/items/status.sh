#!/bin/bash

network=(
  padding_right=0
  padding_left=6
  background.height=24
  background.corner_radius=6
  label.color=$COLOR_BLACK
  label.padding_right=6
  label.font="$FONT:ExtraBold:10.0"
  icon.color=$COLOR_BLACK
  script="$PLUGIN_DIR/network.sh"
)

volume=(
  script="$PLUGIN_DIR/volume.sh"
  click_script="$PLUGIN_DIR/volume_click.sh"
)

battery=(
  update_freq=300
  icon.font="$FONT:Bold:17.5"
  icon.y_offset=1
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar  --add item battery right			\
	   --set battery "${battery[@]}"		\
							\
	   --add item volume right			\
	   --set volume "${volume[@]}"			\
	   --subscribe volume volume_change		\
							\
	   --add item network right                     \
           --set network "${network[@]}"                \
           --subscribe network wifi_change              \
                               mouse.entered            \
                               mouse.exited             \
                               mouse.exited.global      \
							\
	   --add bracket status battery volume network	\
	   --set status "${bracket[@]}"			\
	   --subscribe battery system_woke power_source_change

