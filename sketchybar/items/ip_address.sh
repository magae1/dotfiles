ip_address=(
  icon.color=$BLUE
  update_freq=30
  script="$PLUGIN_DIR/ip_address.sh"
)

sketchybar --add item ip_address right			\
           --set ip_address "${ip_address[@]}"		\
           --subscribe ip_address wifi_change

