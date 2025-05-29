kakao=(
  icon=$ICON_CHAT
  icon.font="$FONT:Bold:18.0"
  icon.color=$YELLOW
  label=$LOADING
  padding_left=10
  padding_right=3
  update_freq=20
  script="$PLUGIN_DIR/noti_kakaotalk.sh"
)


sketchybar --add item kakaotalk right       \
           --set kakaotalk "${kakao[@]}"
