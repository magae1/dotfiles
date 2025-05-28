#!/bin/sh

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Mail")
LABEL=""

if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    if [ "${BASH_REMATCH[1]}" == "" ]; then
        LABEL="0"
    else
        LABEL="${BASH_REMATCH[1]}"
    fi
else
    LABEL="?"
fi

sketchybar --set $NAME drawing=on label="${LABEL}"
