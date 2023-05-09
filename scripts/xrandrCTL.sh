#!/bin/bash

display=$1
BRIGHTNESS_VALUE=$(bc <<< "scale=0; $(xrandr --verbose | grep -A 5 $display | grep Brightness | cut -f2 -d ' ') * 100 / 1" )

if [[ $BRIGHTNESS_VALUE -lt 30 ]]
then
    BRIGHTNESS_ICON=
elif [[ $BRIGHTNESS_VALUE -lt 50 ]]
then
    BRIGHTNESS_ICON=
elif [[ $BRIGHTNESS_VALUE -lt 70 ]]
then
    BRIGHTNESS_ICON=
else
    BRIGHTNESS_ICON=
fi

function calculate {
    if [[ $1 = "up" ]] && [[ $BRIGHTNESS_VALUE -ne 100 ]]
    then
        BRIGHTNESS_VALUE=$((BRIGHTNESS_VALUE+10))
        $(xrandr --output $display --brightness $(bc <<< "scale=1; $BRIGHTNESS_VALUE / 100"))
    elif [[ $1 = "down" ]] && [[ $BRIGHTNESS_VALUE -ne 0 ]]
    then
        BRIGHTNESS_VALUE=$((BRIGHTNESS_VALUE-10))
        $(xrandr --output $display --brightness $(bc <<< "scale=1; $BRIGHTNESS_VALUE / 100"))
    fi
}

if [ $# = 2 ]
then
    calculate $2
fi
echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"
