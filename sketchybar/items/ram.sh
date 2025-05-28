memory=(
  label.font="$FONT:Heavy:12"
  label.color=$WHITE
  icon=$ICON_RAM
  icon.font="$FONT:Bold:16.0"
  icon.color=$GREEN
  update_freq=15
  script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item memory left	\
	   --set memory "${memory[@]}"
