#!/bin/bash

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

brew=(
  padding_right=8
  icon=􀐛
  label=?
  script="$PLUGIN_DIR/brew.sh"
)

github_bell=(
  update_freq=180
  icon=$BELL
  icon.color=$BLUE
  label=$LOADING
  label.highlight_color=$BLUE
  popup.align=right
  script="$PLUGIN_DIR/github.sh"
  click_script="$POPUP_CLICK_SCRIPT"
)

github_template=(
  drawing=off
  background.corner_radius=12
  icon.background.height=2
  icon.background.y_offset=-12
)

mail=(
  icon=$ICON_MAIL
  icon.font="$FONT:Bold:20.0"
  icon.color=$MAGENTA
  label=$LOADING
  update_freq=45
  script="$PLUGIN_DIR/noti_mail.sh"
)

kakao=(
  icon=$ICON_CHAT
  icon.font="$FONT:Bold:18.0"
  icon.color=$YELLOW
  label=$LOADING
  padding_left=8
  update_freq=20
  script="$PLUGIN_DIR/noti_kakaotalk.sh"
)


sketchybar --add event brew_update				\
	   --add item brew right				\
	   --set brew "${brew[@]}"				\
	   --subscribe brew brew_update				\
								\
	   --add item github.bell right				\
           --set github.bell "${github_bell[@]}"		\
           --subscribe github.bell  mouse.entered       	\
                                    mouse.exited        	\
                                    mouse.exited.global 	\
								\
           --add item github.template popup.github.bell		\
           --set github.template "${github_template[@]}"	\
								\
	   --add item mail right				\
	   --set mail "${mail[@]}"				\
								\
	   --add item kakaotalk right				\
	   --set kakaotalk "${kakao[@]}"			\
								\
	   --add bracket noti brew github.bell mail kakaotalk	\
	   --set noti "${bracket[@]}"
