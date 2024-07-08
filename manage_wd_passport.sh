#!/bin/bash

MOUNT_POINT="/mnt/my_passport"
DEVICE="/dev/sda1"
FILESYSTEM_TYPE="ntfs-3g"

function mount_drive {
    # Create the mount point directory if it does not exist
    if [ ! -d "$MOUNT_POINT" ]; then
        sudo mkdir -p "$MOUNT_POINT"
    fi

    # Mount the drive
    sudo mount -t $FILESYSTEM_TYPE $DEVICE $MOUNT_POINT
    if [ $? -eq 0 ]; then
        echo "Drive mounted successfully at $MOUNT_POINT."
    else
        echo "Failed to mount the drive."
    fi
}

function unmount_drive {
    # Unmount the drive
    sudo umount $MOUNT_POINT
    if [ $? -eq 0 ]; then
        echo "Drive unmounted successfully."
    else
        echo "Failed to unmount the drive."
    fi
}

case "$1" in
    mount)
        mount_drive
        ;;
    unmount)
        unmount_drive
        ;;
    *)
        echo "Usage: $0 {mount|unmount}"
        exit 1
        ;;
esac
