#!/bin/bash

# Get the list of open windows using hyprctl and format it for Rofi
WINDOW=$(hyprctl clients | grep "Window" -A 14 | grep -E "Window|workspace|class|title" | awk '
    /Window/ {win_id=$2} 
    /workspace/ {ws=$2} 
    /class/ {class=$2} 
    /title/ {title=substr($0, index($0, $3))} 
    /title/ {print win_id " [" ws "] " class ": " title}
' | rofi -dmenu -i -p "Switch Window")

# Extract window ID and workspace
WINDOW_ID=$(echo "$WINDOW" | awk '{print $1}')
WORKSPACE=$(echo "$WINDOW" | grep -oP '\[\K[0-9]+(?=\])')

# If a window was selected, switch to the correct workspace and focus it
if [ -n "$WINDOW_ID" ] && [ -n "$WORKSPACE" ]; then
    # Switch to the correct workspace if it's not the current one
    hyprctl dispatch workspace "$WORKSPACE"

    # Focus the window
    wlrctl toplevel focus "$WINDOW_ID"
fi

