#!/bin/bash

cryptsetup open /dev/sda3 mecw

mkfs.ext4 /dev/vg/root
mkswap /dev/vg/swap

sleep 2

mount /dev/vg/root /mnt
mkdir /mnt/home
mount /dev/vg/home /mnt/home
swapon /dev/vg/swap

sleep 2

mkfs.fat -F32 /dev/sda2


pacstrap /mnt base base-devel linux-lts linux-firmware mkinitcpio lvm2 vim nano networkmanager dhcpcd wpa_supplicant linux-lts-headers reflector

sleep 3

genfstab -U /mnt >> /mnt/etc/fstab

clear

echo "noatime"
sleep 3

nano /mnt/etc/fstab

arch-chroot /mnt

