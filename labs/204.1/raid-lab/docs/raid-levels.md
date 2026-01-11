### Contents of `/raid-lab/raid-lab/docs/raid-levels.md`

# RAID Levels

## RAID 0 (Striping)

RAID 0, also known as striping, splits data across multiple disks to improve performance. It does not provide redundancy, meaning if one disk fails, all data in the array is lost.

### Characteristics:
- **Performance**: High read and write speeds due to simultaneous access to multiple disks.
- **Capacity**: Total capacity is the sum of all disks in the array.
- **Redundancy**: None.

### Advantages:
- Increased performance for applications requiring high throughput.
- Efficient use of disk space.

### Disadvantages:
- No fault tolerance; data loss occurs if any disk fails.

---

## RAID 1 (Mirroring)

RAID 1, or mirroring, duplicates the same data on two or more disks. This provides redundancy, as data is preserved even if one disk fails.

### Characteristics:
- **Performance**: Good read performance; write performance may be slightly slower due to data being written to multiple disks.
- **Capacity**: Total capacity is equal to the size of the smallest disk in the array.
- **Redundancy**: High.

### Advantages:
- Excellent data protection; data remains accessible even if one disk fails.
- Simple implementation.

### Disadvantages:
- Storage efficiency is only 50% (or less) since data is duplicated.

---

## RAID 5 (Striping with Parity)

RAID 5 combines striping with parity, distributing data and parity information across all disks. This allows for data recovery in case of a single disk failure.

### Characteristics:
- **Performance**: Good read performance; write performance may be slower due to parity calculations.
- **Capacity**: Total capacity is the sum of all disks minus one disk's capacity (used for parity).
- **Redundancy**: Moderate.

### Advantages:
- Balances performance, redundancy, and storage efficiency.
- Can withstand a single disk failure without data loss.

### Disadvantages:
- Write performance can be impacted due to parity calculations.
- More complex to implement than RAID 0 or RAID 1.