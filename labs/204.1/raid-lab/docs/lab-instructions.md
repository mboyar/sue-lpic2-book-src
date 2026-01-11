# lab-instructions.md

# Lab Instructions for mdadm Training Environment

## Overview

This document provides step-by-step instructions for setting up and using the lab environment designed for training on `mdadm` using loop devices. The lab will cover the creation and management of different RAID levels (0, 1, and 5) using scripts provided in the `scripts` directory.

## Prerequisites

- A Linux environment with `mdadm` installed.
- Sufficient permissions to create loop devices and manage RAID arrays.
- Basic knowledge of shell scripting and command-line operations.

## Step 1: Setting Up Loop Devices

1. Open a terminal.
2. Navigate to the `scripts` directory:
   ```bash
   cd /path/to/raid-lab/scripts
   ```
3. Run the setup script to create loop devices:
   ```bash
   ./setup-loop-devices.sh
   ```

## Step 2: Creating RAID Arrays

### Creating RAID 0

1. In the terminal, run the RAID 0 creation script:
   ```bash
   ./create-raid0.sh
   ```

### Creating RAID 1

1. To create a RAID 1 array, execute:
   ```bash
   ./create-raid1.sh
   ```

### Creating RAID 5

1. For RAID 5, run:
   ```bash
   ./create-raid5.sh
   ```

## Step 3: Monitoring RAID Arrays

1. To monitor the status of the RAID arrays, use the monitoring script:
   ```bash
   ./monitor-raid.sh
   ```

## Step 4: Testing RAID Functionality

1. Test the functionality of each RAID level by running the respective test scripts:
   - For RAID 0:
     ```bash
     ./tests/test-raid0.sh
     ```
   - For RAID 1:
     ```bash
     ./tests/test-raid1.sh
     ```
   - For RAID 5:
     ```bash
     ./tests/test-raid5.sh
     ```

## Step 5: Cleanup

1. After completing the lab, clean up the loop devices and RAID arrays by running:
   ```bash
   ./cleanup.sh
   ```

## Conclusion

You have successfully set up and tested different RAID configurations using `mdadm` in a controlled lab environment. For further details on RAID levels and their characteristics, refer to `docs/raid-levels.md`.