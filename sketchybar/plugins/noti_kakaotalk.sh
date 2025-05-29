#!/bin/sh

STATUS_LABEL=$(lsappinfo info -only StatusLabel "KakaoTalk")
LABEL=""

if [ -z "$STATUS_LABEL" ]; then
    LABEL="?"
else
    if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
        LABEL="${BASH_REMATCH[1]}"
    else
        LABEL="0"
    fi
fi

sketchybar --set $NAME drawing=on label="${LABEL}"
