 #!/bin/bash
MENU="$(printf "Lock\nLog out\nSuspend\nReboot\nShutdown")"
SELECTION="$(printf "$MENU" | fuzzel --dmenu -l 5 -p "Power: ")"

case $SELECTION in
    "Lock") swaylock ;;
    "Log out") swaymsg exit ;;
    "Suspend") systemctl suspend ;;
    "Reboot") systemctl reboot ;;
    "Shutdown") systemctl poweroff ;;
esac
