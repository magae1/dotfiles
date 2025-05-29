battery=(
  update_freq=300
  icon.font="$FONT:Bold:17.5"
  icon.color=$WHITE
  icon.y_offset=1
  script="$PLUGIN_DIR/battery.sh"
)


sketchybar --add item battery right 		\
           --set battery "${battery[@]}"	\
           --subscribe battery system_woke power_source_change
