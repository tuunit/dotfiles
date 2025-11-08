#!/bin/bash

connected=$(xrandr | grep " connected " | awk '{print $1}')

if [[ $connected =~ "eDP-1" && $connected =~ "HDMI-1" && $connected =~ "DP-3" ]]; then
  xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x700 --output DP-3 --mode 3440x1440 --pos 1920x0 --output HDMI-1 --mode 2560x1440 --pos 5360x0 &
elif [[ $connected == "eDP-1" ]]; then
  xrandr --output eDP-1 --mode 1920x1200 --pos 0x0 &
elif [[ $connected =~ "HDMI-0" && $connected =~ "DP-4" ]]; then
  xrandr --output DP-4 --mode 3440x1440 --rate 165.00 --pos 0x0 --output HDMI-0 --mode 2560x1440 --rate 69.97 --pos 3440x0 &
fi
