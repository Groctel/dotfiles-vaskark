#!/bin/bash

#
# Rofi pywal favs
#

declare -a options=(
    "Animals"
    "Alexandra"
    "Alicia"
    "Alone"
    "Ana"
    "Blade Runner"
    "Bryce"
    "Building"
    "Dakota"
    "Dystopia"
    "Emma"
    "Emilia"
    "Estonia"
    "Eva"
    "Jessica"
    "Keyboard"
    "Margot"
    "Marion"
    "Mary"
    "Natalie"
    "Olga"
    "Phone"
    "Rachel"
    "Rio"
    "Rooney"
    "Scarlett"
    "Shelby"
    "Sophie"
)

choice=$(printf '%s\n' "${options[@]}" | rofi \
    -dmenu \
    -i \
    -p 'Themes' \
    -hide-scrollbar \
    -matching normal \
    -theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 15%;} listview {lines: 5;}' \
    -font 'scientifica bold 8')

case $choice in
    'Animals')
        wal -f animals -o wal-extras.sh ;;
    'Alexandra')
        wal -f alexandra4 -o wal-extras.sh ;;
    'Alicia')
        wal -f alicia1 -o wal-extras.sh ;;
    'Alone')
        wal -f alone -o wal-extras.sh ;;
    'Ana')
        wal -f ana13 -o wal-extras.sh ;;
    'Blade Runner')
        wal -f br -o wal-extras.sh ;;
    'Bryce')
        wal -f bryce1 -o wal-extras.sh ;;
    'Building')
        wal -f building -o wal-extras.sh ;;
    'Dakota')
        wal -f dakota5 -o wal-extras.sh ;;
    'Dystopia')
        wal -f dystopia -o wal-extras.sh ;;
    'Emma')
        wal -f emma16 -o wal-extras.sh ;;
    'Emilia')
        wal -f emilia5 -o wal-extras.sh ;;
    'Estonia')
        wal -f estonia -o wal-extras.sh ;;
    'Eva')
        wal -f eva1 -o wal-extras.sh ;;
    'Jessica')
        wal -f jess1 -o wal-extras.sh ;;
    'Keyboard')
        wal -f kb -o wal-extras.sh ;;
    'Margot')
        wal -f margot1 -o wal-extras.sh ;;
    'Marion')
        wal -f marion3 -o wal-extras.sh ;;
    'Mary')
        wal -f mary1 -o wal-extras.sh ;;
    'Natalie')
        wal -f nat12 -o wal-extras.sh ;;
    'Olga')
        wal -f olga2 -o wal-extras.sh ;;
    'Phone')
        wal -f phone -o wal-extras.sh ;;
    'Rachel')
        wal -f rachel3 -o wal-extras.sh ;;
    'Rio')
        wal -f rio -o wal-extras.sh ;;
    'Rooney')
        wal -f rooney7 -o wal-extras.sh ;;
    'Scarlett')
        wal -f scarlett1 -o wal-extras.sh ;;
    'Shelby')
        wal -f shelby2 -o wal-extras.sh ;;
    'Sophie')
        wal -f sophie5 -o wal-extras.sh ;;
esac
