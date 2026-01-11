#!/bin/bash

# This script creates a RAID 1 array using the configured loop devices.

# Define loop device files
LOOP_DEV1="/dev/loop-raid1-0"
LOOP_DEV2="/dev/loop-raid1-1"
# Create loop devices
if [ ! -e $LOOP_DEV1 ]; then
    mknod $LOOP_DEV1 b 7 110
fi
if [ ! -e $LOOP_DEV2 ]; then
    mknod $LOOP_DEV2 b 7 111
fi
# Create loopback files
# Define loopback file paths
# These files will be used as the backing storage for the loop devices
# Define loopback file names    
LOOP_BACK_FILE1="/tmp/loopback-raid1-0.img"
LOOP_BACK_FILE2="/tmp/loopback-raid1-1.img"

# Create loopback files
dd if=/dev/zero of=$LOOP_BACK_FILE1 bs=1M count=100
dd if=/dev/zero of=$LOOP_BACK_FILE2 bs=1M count=100

# Set up loop devices
losetup $LOOP_DEV1 $LOOP_BACK_FILE1
losetup $LOOP_DEV2 $LOOP_BACK_FILE2

# Define RAID device name
RAID_DEVICE=/dev/md1

# Create RAID 1 array
mdadm --create --verbose ${RAID_DEVICE} --level=1 --raid-devices=2 $LOOP_DEV1 $LOOP_DEV2

# Format the RAID array
mkfs.ext4 ${RAID_DEVICE}

# Display the RAID array status
mdadm --detail ${RAID_DEVICE}

echo "RAID 1 array created successfully."