#!/bin/bash

connected=$(xrandr | grep " connected " | awk '{print $1}')

if [[ $connected =~ "eDP-1" && $connected =~ "HDMI-1" && $connected =~ "DP-3" ]]; then
  xrandr --output DP-3 --mode 2560x1440 --pos 0x0 --output HDMI-1 --mode 3440x1440 --pos 2560x0 --output eDP-1 --mode 1920x1200 --pos 6000x720 &
elif [[ $connected == "eDP-1" ]]; then
  xrandr --output eDP-1 --mode 1920x1200 --pos 0x0 &
elif [[ $connected =~ "DP-4" && $connected =~ "DP-2" ]]; then
  xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --output DP-2 --mode 3440x1440 --pos 2560x0 &
fi
