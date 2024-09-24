#!/bin/bash

if [[ $# -eq 0 ]]; then
  while true; do
    curl -sL https://unsplash.it/3440/1440/\?random | feh --bg-fill -
    sleep 300
  done
else
    curl -sL https://unsplash.it/3440/1440/\?random | feh --bg-fill -
fi
