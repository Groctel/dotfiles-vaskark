#!/bin/bash

## By me
## Inspired by Aditya Shakya

MENU="$(rofi -sep "|" -dmenu -i -p 'wal favs' -location 0 -width 10 -hide-scrollbar -line-padding 4 -padding 20 -lines 11 -font "Iosevka Custom 8" <<< "Coliseum|Cars|Shelby|Astronaut|Chicago|Skyfall|Matrix|BR|Stairway|Museum|FutureParis")"

case "$MENU" in
	*Coliseum) wal -i ~/Pictures/favs/bence-boros-178730-unsplash.jpg -a 90 && wal-berry.sh ;;
	*Cars) wal -i ~/Pictures/favs/2cia48lnxqw31-m.jpg -a 90 && wal-berry.sh ;;
	*Shelby) wal -i ~/Pictures/favs/676514-m.jpg -a 90 && wal-berry.sh ;;
	*Astronaut) wal -i ~/Pictures/favs/uigXpL3cPvQTlRro81PfdsBRT7jyTPpUMzFUGBcZnkA-m.jpg --backend haishoku -a 90 && wal-berry.sh ;;
	*Chicago) wal -i ~/Pictures/favs/xypxkarz6h341-m.jpg -a 90 && wal-berry.sh ;;
	*Skyfall) wal -i ~/Pictures/fgvKe0O-skyfall.jpg -a 90 && wal-berry.sh ;;
        *Matrix) wal -i ~/Pictures/favs/image_6483441.JPG -a 90 && wal-berry.sh ;;
	*BR) wal -i ~/Pictures/favs/FsIVsFQ.jpg -a 90 && wal-berry.sh ;;
	*Stairway) wal -i ~/Pictures/favs/7n6mldxwd8m31.jpg -a 90 && wal-berry.sh ;;
	*Museum) wal -i ~/Pictures/favs/b6xfmpv54f341.jpg -a 90 && wal-berry.sh ;;
	*FutureParis) wal -i ~/Pictures/favs/future_paris-m.jpg -a 90 && wal-berry.sh
esac
