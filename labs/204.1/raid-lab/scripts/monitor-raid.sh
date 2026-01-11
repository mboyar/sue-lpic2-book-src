#!/bin/bash

# This script monitors the status of the RAID arrays using mdadm
# and outputs the current state of the arrays.

# Function to display RAID status
function display_raid_status {
    echo "Current RAID status:"
    cat /proc/mdstat
    echo ""
    echo "Detailed RAID information:"
    mdadm --detail --scan
}

# Monitor RAID arrays
while true; do
    display_raid_status
    sleep 5  # Check every 5 seconds
done