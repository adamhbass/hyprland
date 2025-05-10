#!/bin/bash

# Check if the Bluetooth adapter is powered
powered=$(bluetoothctl show | grep "Powered: yes")

# Check if any device is connected
connected=$(bluetoothctl info | grep "Connected: yes")
device_name=$(bluetoothctl info | grep "Name:" | cut -d ' ' -f2-)

if [[ -z "$powered" ]]; then
    echo "🔴 Bluetooth: On"
elif [[ -n "$connected" ]]; then
    echo "🎧 $device_name"
else
    echo "🟡 Bluetooth: Off"
fi
