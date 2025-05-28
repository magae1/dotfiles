battery=(
  update_freq=300
  label.font="$FONT:Heavy:12"
  icon.font="$FONT:Bold:16.0"
  icon.color=$YELLOW
  script="$PLUGIN_DIR/battery.sh"
)


sketchybar --add item battery right 		\
           --set battery "${battery[@]}"	\
           --subscribe battery system_woke power_source_change
