#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')
HOTSPOT=$(ipconfig getsummary en0 | grep IsExpensive | awk '{print $3}')

if [[ $IS_VPN != "" ]]; then
  COLOR=$CYAN
  ICON=$ICON_VPN
  LABEL="VPN"
elif [[ $HOTSPOT = "TRUE" ]]; then
  COLOR=$GREEN
  ICON=$ICON_HOTSPOT
  LABEL=$IP_ADDRESS
elif [[ $IP_ADDRESS != "" ]]; then
  COLOR=$COLOR_BLUE
  ICON=$ICON_WIFI
  LABEL=$IP_ADDRESS
else
  COLOR=$WHITE
  ICON=$ICON_WIFI_OFF
  LABEL="Not Connected"
fi

if [[ $LABEL = "" ]]; then
  LABEL="LOADING"
fi

sketchybar --set $NAME background.color=$COLOR	\
			 icon=$ICON			\
			 label="$LABEL"
