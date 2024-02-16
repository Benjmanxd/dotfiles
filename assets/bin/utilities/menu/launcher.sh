#!/bin/sh
# sh ~/.config/bin/utilities/menu/accent.sh

rofi \
	-show "$1" \
	-modi run,drun,window,filebrowser \
	-no-lazy-grab \
	-scroll-method 0 \
	-drun-match-fields all \
	-no-drun-show-actions \
	-terminal alacritty \
  -kb-cancel Alt-F1 \
	-theme ~/.config/rofi/launcher.rasi
