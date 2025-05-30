#!/bin/bash

network=(
  padding_right=8
  label.drawing=off
  icon.font="CaskaydiaCove Nerd Font:Book:16.0"
  popup.align=left
  script="$PLUGIN_DIR/network.sh"
)

network_down=( 
  y_offset=-7
  label.font="$FONT:Heavy:10"
  script="$PLUGIN_DIR/network_stat.sh"
  update_freq=1
)

network_up=(
  y_offset=7
  label.font="$FONT:Heavy:10"
  background.padding_right=-52
)

ip_address=(
  padding_left=3
  padding_right=6
)

sketchybar --add item network right			\
           --set network "${network[@]}"		\
           --subscribe network wifi_change		\
			       mouse.entered		\
			       mouse.exited		\
			       mouse.exited.global	\
	   --add item network.down right		\
	   --set network.down "${network_down[@]}"	\
	   --add item network.up right			\
	   --set network.up "${network_up[@]}"		\
	   --add item network.ip_address popup.network	\
	   --set network.ip_address "${ip_address[@]}"	\
							\
	   --add bracket bracket.network network	\
					 network.down	\
					 network.up	\
	   --set bracket.network "${bracket[@]}"
