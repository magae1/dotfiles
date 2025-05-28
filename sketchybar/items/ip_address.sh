ip_address=(
  label.font="$FONT:Semibold:12.0"
  icon.font="CaskaydiaCove Nerd Font:Book:16.0"
  padding_left=2
  padding_right=12
  update_freq=30
  script="$PLUGIN_DIR/ip_address.sh"
)

sketchybar --add item ip_address left			\
           --set ip_address "${ip_address[@]}"		\
           --subscribe ip_address wifi_change

