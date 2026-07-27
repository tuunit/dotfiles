#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

if command -v apt-get >/dev/null; then
    packages=(
        stow sway fuzzel waybar mako-notifier swaylock swayidle dex # nwg-displays
        grim slurp wl-clipboard swaybg kanshi wireplumber brightnessctl
        xdg-desktop-portal xdg-desktop-portal-wlr
    )
    sudo apt-get update
    sudo apt-get install --yes "${packages[@]}"
elif command -v pacman >/dev/null; then
    packages=(
        stow sway fuzzel waybar mako swaylock swayidle dex
        grim slurp wl-clipboard swaybg kanshi nwg-displays wireplumber brightnessctl
        xdg-desktop-portal xdg-desktop-portal-wlr
    )
    sudo pacman -S --needed "${packages[@]}"
else
    printf 'Unsupported package manager. Install the Sway dependencies manually.\n' >&2
    exit 1
fi

stow --dir "$repo_root" --target "$HOME" --restow sway
