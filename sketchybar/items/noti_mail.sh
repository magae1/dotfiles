mail=(
  icon=$ICON_MAIL
  icon.font="$FONT:Bold:20.0"
  icon.color=$MAGENTA
  label=$LOADING
  padding_left=3
  padding_right=3
  update_freq=45
  script="$PLUGIN_DIR/noti_mail.sh"
)



sketchybar --add item mail right       \
           --set mail "${mail[@]}"
