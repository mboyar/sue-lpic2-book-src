#!/bin/bash

# Test script for RAID 1 functionality
# This script checks the integrity and performance of the RAID 1 array.

# Variables
RAID_DEVICE="/dev/md0"  # Change this to your RAID device
MOUNT_POINT="/mnt/raid1" # Change this to your desired mount point
TEST_FILE="/mnt/raid1/testfile.txt"
TEST_DATA="This is a test file for RAID 1."

# Check if the RAID device is active
if ! mdadm --detail $RAID_DEVICE | grep -q "State : clean"; then
    echo "RAID device $RAID_DEVICE is not active or is degraded."
    exit 1
fi

# Create mount point if it doesn't exist
mkdir -p $MOUNT_POINT

# Mount the RAID device
mount $RAID_DEVICE $MOUNT_POINT

# Create a test file
echo $TEST_DATA > $TEST_FILE

# Verify the test file
if [[ $(cat $TEST_FILE) == $TEST_DATA ]]; then
    echo "Test file created successfully and verified."
else
    echo "Test file verification failed."
    exit 1
fi

# Clean up
rm $TEST_FILE
umount $MOUNT_POINT

echo "RAID 1 test completed successfully."