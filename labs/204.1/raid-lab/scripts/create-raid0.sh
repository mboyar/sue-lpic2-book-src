#!/bin/bash

# This script creates a RAID 0 array using the configured loop devices.

# Define loop device files
LOOP_DEV1="/dev/loop-raid0-0"
LOOP_DEV2="/dev/loop-raid0-1"
# Create loop devices
if [ ! -e $LOOP_DEV1 ]; then
    mknod $LOOP_DEV1 b 7 100
fi
if [ ! -e $LOOP_DEV2 ]; then
    mknod $LOOP_DEV2 b 7 101
fi
# Create loopback files
# Define loopback file paths
# These files will be used as the backing storage for the loop devices
LOOP_FILE1="/tmp/loopfile-raid0-0.img"
LOOP_FILE2="/tmp/loopfile-raid0-1.img"

# Create loopback files
dd if=/dev/zero of=$LOOP_FILE1 bs=1M count=100
dd if=/dev/zero of=$LOOP_FILE2 bs=1M count=100

# Set up loop devices
losetup $LOOP_DEV1 $LOOP_FILE1
losetup $LOOP_DEV2 $LOOP_FILE2

# Define RAID device name
RAID_DEVICE=/dev/md0

# Create RAID 0 array
mdadm --create --verbose ${RAID_DEVICE} --level=0 --raid-devices=2 $LOOP_DEV1 $LOOP_DEV2

# Format the RAID array
mkfs.ext4 ${RAID_DEVICE}

# Display the RAID array information
mdadm --detail ${RAID_DEVICE}

echo "RAID 0 array created successfully."