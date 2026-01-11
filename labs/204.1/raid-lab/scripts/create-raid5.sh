#!/bin/bash

# This script creates a RAID 5 array using the configured loop devices.

# Define loop device files and RAID device name
LOOP_DEVICES=(/dev/loop-raid5-0 /dev/loop-raid5-1 /dev/loop-raid5-2)
# Create loop devices if they do not exist
for i in "${!LOOP_DEVICES[@]}"; do
    LOOP_DEVICES[$i]="/dev/loop-raid5-$i"
    if [ ! -e "${LOOP_DEVICES[$i]}" ]; then
        mknod "${LOOP_DEVICES[$i]}" b 7 $((150 + i))
    fi
done
# Create loopback files
# Define loopback file paths
# These files will be used as the backing storage for the loop devices
LOOP_BACK_FILES=("/tmp/loopback-raid5-0.img" "/tmp/loopback-raid5-1.img" "/tmp/loopback-raid5-2.img")
# Create loopback files
for i in "${!LOOP_BACK_FILES[@]}"; do
    if [ ! -f "${LOOP_BACK_FILES[$i]}" ]; then
        dd if=/dev/zero of="${LOOP_BACK_FILES[$i]}" bs=1M count=100-raid
    fi
done
# Set up loop devices
for i in "${!LOOP_DEVICES[@]}"; do
    losetup "${LOOP_DEVICES[$i]}" "${LOOP_BACK_FILES[$i]}"
done

# Define RAID device name
RAID_DEVICE=/dev/md5
# Check if the RAID device already exists
if [ -e "$RAID_DEVICE" ]; then
    echo "Removing existing RAID device $RAID_DEVICE"
    mdadm --stop "$RAID_DEVICE"
    mdadm --remove "$RAID_DEVICE"
else
    # Create the RAID device if it does not exist
    mknod "$RAID_DEVICE" b 9 0
fi

# Create RAID 5 array
echo "Creating RAID 5 array on $RAID_DEVICE"
mdadm --create --verbose "$RAID_DEVICE" --level=5 --raid-devices=3 "${LOOP_DEVICES[@]}"

# Create a filesystem on the RAID device
mkfs.ext4 "$RAID_DEVICE"

# Display the RAID array status
mdadm --detail "$RAID_DEVICE"

echo "RAID 5 array created successfully on $RAID_DEVICE"