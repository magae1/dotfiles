wifi=(
  icon.highlight=on
  label.highlight=on
  background.border_width=0
  background.corner_radius=6
  background.height=24
  padding_left=2
  padding_right=8
  update_freq=5
  script="$PLUGIN_DIR/wifi.sh"
  click_script="osascript -e 'tell application \"System Events\" to click menu bar item 3 of menu bar 1 of application process \"ControlCenter\"'"
)

sketchybar --add item wifi right	\
	   --set wifi "${wifi[@]}"	\
	   --subscribe wifi wifi_change \
