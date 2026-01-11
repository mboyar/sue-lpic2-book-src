# RAID Lab Environment

This project provides a step-by-step lab environment for training on `mdadm` using loop devices. It includes scripts for setting up and managing RAID arrays, configuration files, testing scripts, and documentation.

## Project Structure

- **scripts/**: Contains shell scripts for setting up loop devices, creating RAID arrays, monitoring RAID status, and cleaning up.
  - `setup-loop-devices.sh`: Sets up loop devices for testing.
  - `create-raid0.sh`: Creates a RAID 0 array.
  - `create-raid1.sh`: Creates a RAID 1 array.
  - `create-raid5.sh`: Creates a RAID 5 array.
  - `monitor-raid.sh`: Monitors the status of RAID arrays.
  - `cleanup.sh`: Cleans up loop devices and RAID arrays.

- **configs/**: Contains configuration files for `mdadm`.
  - `mdadm.conf`: Configuration settings for RAID arrays.

- **tests/**: Contains testing scripts for verifying the functionality of the RAID arrays.
  - `test-raid0.sh`: Tests the RAID 0 array.
  - `test-raid1.sh`: Tests the RAID 1 array.
  - `test-raid5.sh`: Tests the RAID 5 array.

- **docs/**: Contains documentation for the lab environment.
  - `lab-instructions.md`: Step-by-step instructions for setting up and using the lab.
  - `raid-levels.md`: Explanation of different RAID levels and their characteristics.

- **Makefile**: Contains build instructions and commands for automating tasks related to the lab environment.

## Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `scripts/setup-loop-devices.sh` to set up the loop devices.
4. Use the appropriate script in the `scripts/` directory to create the desired RAID array.
5. Monitor the RAID status using `scripts/monitor-raid.sh`.
6. Run the tests in the `tests/` directory to verify the functionality of the RAID arrays.
7. Clean up the environment using `scripts/cleanup.sh` when finished.

## Usage Guidelines

This lab environment is designed for educational purposes to help users understand and practice configuring and managing software RAID using `mdadm`. Follow the instructions in `docs/lab-instructions.md` for detailed guidance on each step.