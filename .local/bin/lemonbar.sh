#!/bin/bash

# clock
Clock() {
        DATETIME=$(date "+%-I:%M %p")
        echo -n " $DATETIME"
}

# battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "$BATPERC"
}

# mpc
Mpc() {
	MPCCUR=$(mpc current)
	echo " $MPCCUR"
}

# load bar
while true; do
    echo "%{c}$(Mpc) %{r}$(Battery) $(Clock) "
        sleep 1
done
