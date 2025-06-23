#!/bin/bash

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Mail")
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

if [[ $LABEL = "" ]]; then
  LABEL="0"
fi

sketchybar --set $NAME drawing=on label="${LABEL}"
