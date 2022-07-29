#!/usr/bin/env bash


#
# Pywal favs
#


declare -a options=(
    "Alexandra"
    "Alicia"
    "Alone"
    "Amy"
    "Ana"
    "Angelina"
    "Animals"
    "Australis"
    "Blade Runner"
    "Bryce"
    "Building"
    "Caitriona"
    "Dakota"
    "Dystopia"
    "Elle"
    "Emma"
    "Emilia"
    "Estonia"
    "Eva"
    "Gemma"
    "Hailee"
    "Jenn"
    "Jessica"
    "Keyboard"
    "Maisie"
    "Margot"
    "Marion"
    "Mary"
    "Monica"
    "Natalie"
    "Olga"
    "Phone"
    "Rachel"
    "Rain"
    "Rio"
    "Rooney"
    "Rose"
    "Scarlett"
    "Shelby"
    "Sophie"
    "Tori"
    "ZD30"
)

choice=$(printf '%s\n' "${options[@]}" | \
    rofi \
    -dmenu \
    -i \
    -p 'Themes' \
    -hide-scrollbar \
    -matching fuzzy \
    -font 'scientifica bold 8' \
    -theme "$HOME/.cache/wal/colors-rofi-mine.rasi" \
    -theme-str 'window {width: 10%;} listview {lines: 4; columns: 1;}'
)

case $choice in
    'Alexandra')
        wal -f alexandra4 -o wal-extras.sh ;;
    'Alicia')
        wal -f alicia1 -o wal-extras.sh ;;
    'Alone')
        wal -f alone -o wal-extras.sh ;;
    'Amy')
        wal -f amy6 -o wal-extras.sh ;;
    'Ana')
        wal -f ana13 -o wal-extras.sh ;;
    'Angelina')
        wal -f angelina1 -o wal-extras.sh ;;
    'Animals')
        wal -f animals -o wal-extras.sh ;;
    'Australis')
        wal -f australis -o wal-extras.sh ;;
    'Blade Runner')
        wal -f br -o wal-extras.sh ;;
    'Bryce')
        wal -f bryce1 -o wal-extras.sh ;;
    'Building')
        wal -f building -o wal-extras.sh ;;
    'Caitriona')
        wal -f caitriona3 -o wal-extras.sh ;;
    'Dakota')
        wal -f dakota5 -o wal-extras.sh ;;
    'Dystopia')
        wal -f dystopia -o wal-extras.sh ;;
    'Elle')
        wal -f elle1 -o wal-extras.sh ;;
    'Emma')
        wal -f emma16 -o wal-extras.sh ;;
    'Emilia')
        wal -f emilia5 -o wal-extras.sh ;;
    'Estonia')
        wal -f estonia -o wal-extras.sh ;;
    'Eva')
        wal -f eva1 -o wal-extras.sh ;;
    'Gemma')
        wal -f gemma15 -o wal-extras.sh ;;
    'Hailee')
        wal -f hailee2 -o wal-extras.sh ;;
    'Jenn')
        wal -f jenn2 -o wal-extras.sh ;;
    'Jessica')
        wal -f jess1 -o wal-extras.sh ;;
    'Keyboard')
        wal -f kb -o wal-extras.sh ;;
    'Maisie')
        wal -f maisie1 -o wal-extras.sh ;;
    'Margot')
        wal -f margot1 -o wal-extras.sh ;;
    'Marion')
        wal -f marion3 -o wal-extras.sh ;;
    'Mary')
        wal -f mary1 -o wal-extras.sh ;;
    'Monica')
        wal -f monica3 -o wal-extras.sh ;;
    'Natalie')
        wal -f nat12 -o wal-extras.sh ;;
    'Olga')
        wal -f olga2 -o wal-extras.sh ;;
    'Phone')
        wal -f phone -o wal-extras.sh ;;
    'Rachel')
        wal -f rachel3 -o wal-extras.sh ;;
    'Rain')
        wal -f rain -o wal-extras.sh ;;
    'Rio')
        wal -f rio -o wal-extras.sh ;;
    'Rooney')
        wal -f rooney7 -o wal-extras.sh ;;
    'Rose')
        wal -f rose2 -o wal-extras.sh ;;
    'Scarlett')
        wal -f scarlett1 -o wal-extras.sh ;;
    'Shelby')
        wal -f shelby2 -o wal-extras.sh ;;
    'Sophie')
        wal -f sophie5 -o wal-extras.sh ;;
    'Tori')
        wal -f tori2 -o wal-extras.sh ;;
    'ZD30')
        wal -f zd302 -o wal-extras.sh ;;
esac