# Makefile for RAID Lab Environment

.PHONY: all setup test cleanup

all: setup test

setup:
	@echo "Setting up loop devices..."
	./scripts/setup-loop-devices.sh

test: 
	@echo "Running tests for RAID 0..."
	./tests/test-raid0.sh
	@echo "Running tests for RAID 1..."
	./tests/test-raid1.sh
	@echo "Running tests for RAID 5..."
	./tests/test-raid5.sh

cleanup:
	@echo "Cleaning up RAID arrays and loop devices..."
	./scripts/cleanup.sh