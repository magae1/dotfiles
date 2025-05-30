#!/bin/bash

source "$ITEM_DIR/cpu.sh"
source "$ITEM_DIR/ram.sh"
source "$ITEM_DIR/disk.sh"

sketchybar --add bracket activity cpu.percent ram disk \
	   --set activity "${bracket[@]}"
