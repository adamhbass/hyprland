#!/bin/bash
kitty --class scratchpad &
sleep 0.2
hyprctl dispatch movetoworkspace special:scratchpad, class:scratchpad
