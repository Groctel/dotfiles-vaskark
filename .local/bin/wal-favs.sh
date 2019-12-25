#!/bin/bash

## By me
## Inspired by Aditya Shakya

MENU="$(rofi -sep "|" -dmenu -i -p 'wal favs' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 10 -font "Iosevka Custom 8" <<< "Colesium|Cars|Shelby|Astronaut|Chicago|Skyfall|Matrix|BR|Stairway|Museum")"

case "$MENU" in
	*Colesium) wal -i ~/Pictures/favs/bence-boros-178730-unsplash.jpg ;;
	*Cars) wal -i ~/Pictures/favs/2cia48lnxqw31-m.jpg ;;
	*Shelby) wal -i ~/Pictures/favs/676514-m.jpg ;;
	*Astronaut) wal -i ~/Pictures/favs/uigXpL3cPvQTlRro81PfdsBRT7jyTPpUMzFUGBcZnkA-m.jpg --backend haishoku ;;
	*Chicago) wal -i ~/Pictures/favs/xypxkarz6h341-m.jpg ;;
	*Skyfall) wal -i ~/Pictures/fgvKe0O-skyfall.jpg ;;
        *Matrix) wal -i ~/Pictures/favs/image_6483441.JPG ;;
	*BR) wal -i ~/Pictures/favs/FsIVsFQ.jpg ;;
	*Stairway) wal -i ~/Pictures/favs/7n6mldxwd8m31.jpg ;;
	*Museum) wal -i ~/Pictures/favs/b6xfmpv54f341.jpg
esac
