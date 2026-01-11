#!/bin/bash

# Test script for RAID 0 functionality

# Variables
RAID_DEVICE="/dev/md0"
MOUNT_POINT="/mnt/raid0"
TEST_FILE="/mnt/raid0/testfile.txt"
LOOP_DEVICES=(/dev/loop0 /dev/loop1)

# Function to check if RAID is active
check_raid_active() {
    if [ ! -e "$RAID_DEVICE" ]; then
        echo "RAID device $RAID_DEVICE does not exist."
        exit 1
    fi
}

# Function to test data integrity
test_data_integrity() {
    echo "Testing data integrity..."
    echo "Hello, RAID 0!" > "$TEST_FILE"
    if ! cmp -s "$TEST_FILE" <(echo "Hello, RAID 0!"); then
        echo "Data integrity test failed!"
        exit 1
    fi
    echo "Data integrity test passed."
}

# Function to test performance
test_performance() {
    echo "Testing performance..."
    dd if=/dev/zero of="$TEST_FILE" bs=1M count=100 oflag=direct
    echo "Performance test completed."
}

# Main script execution
check_raid_active
test_data_integrity
test_performance

# Cleanup
rm -f "$TEST_FILE"
echo "Test completed successfully."