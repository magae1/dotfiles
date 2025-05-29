#!/bin/bash


update() {
  source "$HOME/.config/sketchybar/colors.sh"
  source "$HOME/.config/sketchybar/icons.sh"

  IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
  IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')
  HOTSPOT=$(ipconfig getsummary en0 | grep sname | awk '{print $3}')

  if [[ $IS_VPN != "" ]]; then
	  COLOR=$CYAN
	  ICON=$ICON_VPN
	  LABEL="VPN"
  elif [[ $HOTSPOT != "" ]]; then
	  COLOR=$GREEN
	  ICON=$ICON_HOTSPOT
	  LABEL=$IP_ADDRESS
  elif [[ $IP_ADDRESS != "" ]]; then
	  COLOR=$BLUE
	  ICON=$ICON_WIFI
	  LABEL=$IP_ADDRESS
  else
	  COLOR=$WHITE
	  ICON=$ICON_WIFI_OFF
	  LABEL="Not Connected"
  fi

  sketchybar --set $NAME icon.color=$COLOR		\
			 icon=$ICON			\
	     --set network.ip_address label="$LABEL"
}

popup() {
  sketchybar --set $NAME popup.drawing=$1
}

case "$SENDER" in
  "wifi_change") update
  ;;
  "mouse.entered") popup on
  ;;
  "mouse.exited"|"mouse.exited.global") popup off
  ;;
  "mouse.clicked") popup toggle
  ;;
esac
