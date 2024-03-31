## Lab: Filesystems
1. Let's create a image file filled with zero `dd if=/dev/zero of=imagefile.img bs=1M count=100` 
2. Now format it with `mkfs.ext4 imagefile.img` or `mkfs -t ext4 imagefile.img`. And check the result by using `file imagefile.img`   
3. Create a folder with `mkdir /mnt/image/`. And create some test files by using such as command `touch test-$(date +%d%m%Y-%H%M%S)-local.txt` under the folder "/mnt/image" 
4. Mount the ext4 formatted img file to the folder created in Step 3 with `mount -o loop imagefile.img /mnt/image`, and check: 
    * content of the folder after mount operation
    * compare the list in "/etc/mtab" content and `mount` output
    * used loop devices with `losetup --all` or `losetup --list`
5. And create some test files by using such as command `touch test-$(date +%d%m%Y-%H%M%S)-in-img.txt` under the folder "/mnt/image"
6. Umount with `umount /mnt/image`, and recheck the items mentioned in Step 4.
7. Now make again mount/umount steps by creating systemd mount unit file such as "/lib/systemd/system/mnt-image.mount" and then run `systemctl daemon-reload`. An example mount unit file;
    ```
    [Unit]
    Description=Data for User

    [Mount]
    What=/home/vagrant/imagefile.img 
    Where=/mnt/image
    Type=ext4
    Options=loop
    
    [Install]
    WantedBy=multi-user.target
    ```
8. Mount the ext4 formatted img file to the folder created in Step 3 with `systemctl start mnt-image.mount`, and check the list in Step 4. Additionally, check the output of `systemctl status mnt-image.mount`.
9. Umount with `systemctl stop mnt-image.mount`, and recheck the items mentioned in Step 4 and Step 8. 

