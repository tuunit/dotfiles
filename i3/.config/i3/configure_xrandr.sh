#!/bin/bash

if [ "$HOSTNAME" == "tower" ]; then 
  xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --output DP-2 --mode 3440x1440 --pos 2560x0 &
elif [ "$HOSTNAME" == "wiflyer" ]; then
  xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --output DP-2 --mode 3440x1440 --pos 2560x0 &
else
  xrandr --output DP-3 --mode 2560x1440 --pos 0x0 --output HDMI-1 --mode 3440x1440 --pos 2560x0 --output eDP-1 --mode 1920x1200 --pos 6000x720 &
fi
