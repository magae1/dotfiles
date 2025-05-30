#!/bin/bash

volume=(
  padding_left=8
  icon.font="$FONT:Bold:14"
  script="$PLUGIN_DIR/volume.sh"
  click_script="$PLUGIN_DIR/volume_click.sh"
)

battery=(
  update_freq=300
  icon.font="$FONT:Bold:17.5"
  icon.y_offset=1
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right		\
	   --set battery "${battery[@]}"	\
						\
	   --add item volume right		\
	   --set volume "${volume[@]}"		\
	   --subscribe volume volume_change	\
						\
	   --add bracket status battery volume	\
	   --set status "${bracket[@]}"
