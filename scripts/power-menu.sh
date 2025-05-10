#!/bin/bash

chosen=$(echo -e "Shutdown\nReboot\nLogout\nCancel" | rofi -dmenu -p "Power")


case "$chosen" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Logout) hyprctl dispatch exit ;;
esac
