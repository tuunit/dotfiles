#!/bin/bash

if [[ $# -eq 0 ]]; then
  while true; do
    feh --bg-fill $(ls ~/Wallpapers/*.jpg | shuf -n 1)
    sleep 300
  done
else
    feh --bg-fill $(ls ~/Wallpapers/*.jpg | shuf -n 1)
fi
