mail=(
  icon=$ICON_MAIL
  icon.font="$FONT:Bold:20.0"
  icon.color=$MAGENTA
  label=$LOADING
  label.color=$MAGENTA
  update_freq=60
  script="$PLUGIN_DIR/noti_mail.sh"
)



sketchybar --add item mail right       \
           --set mail "${mail[@]}"
