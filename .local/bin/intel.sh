#!/bin/bash -f

while IFS=: read -r key val; do
    case $key in
        stepping*)   : ${stepping:=$val} ;;
        cpu*family*) : ${family:=$val}   ;;
        model*)      : ${model:=$val}    ;;
    esac
done < /proc/cpuinfo
printf "%02x-%02x-%02x\n" "$family" "$model" "$stepping"