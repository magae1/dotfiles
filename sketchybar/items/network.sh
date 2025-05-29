network=(
  label.width=0
  icon.font="CaskaydiaCove Nerd Font:Book:16.0"
  popup.align=left
  script="$PLUGIN_DIR/network.sh"
)

network_down=( 
  y_offset=-7
  label.font="$FONT:Heavy:10"
  label.width=48
  label.align=right
  script="$PLUGIN_DIR/network_stat.sh"
  update_freq=1
)

network_up=(
  y_offset=7
  label.font="$FONT:Heavy:10"
  label.width=48
  label.align=right
  background.padding_left=-58
)

ip_address=(
  padding_left=3
  padding_right=6
)

sketchybar --add item network left			\
           --set network "${network[@]}"		\
           --subscribe network wifi_change		\
			       mouse.entered		\
			       mouse.exited		\
			       mouse.exited.global	\
	   --add item network.down left			\
	   --set network.down "${network_down[@]}"	\
	   --add item network.up left			\
	   --set network.up "${network_up[@]}"		\
	   --add item network.ip_address popup.network	\
	   --set network.ip_address "${ip_address[@]}"
