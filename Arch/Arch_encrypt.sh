#!/bin/bash

echo "Hi"
sleep 2
clear


echo "cryptsetup open /dev/sda3 mecw"
cryptsetup open /dev/sda3
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "cryptsetup open /dev/sda3"
cryptsetup open /dev/sda3
sleep 1
fi

clear

echo "mkfs.ext4 /dev/vg/root"
mkfs.ext4 /dev/vg/root
sleep 3
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "mkfs.ext4 /dev/vg/root"
mkfs.ext4 /dev/vg/root
sleep 1
fi

clear

echo "mkswap /dev/vg/swap"
mkswap /dev/vg/swap
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "mkswap /dev/vg/swap"
mkswap /dev/vg/swap
sleep 1
fi

clear

echo "mount /dev/vg/root /mnt"
mount /dev/vg/root /mnt
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "mount /dev/vg/root /mnt"
mount /dev/vg/root /mnt
sleep 1
fi

clear

echo "mkdir /mnt/home"
mkdir /mnt/home
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "mkdir /mnt/home"
mkdir /mnt/home
sleep 1
fi

clear

echo "mount /dev/vg/home /mnt/home"
mount /dev/vg/home /mnt/home
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "mount /dev/vg/home /mnt/home"
mount /dev/vg/home /mnt/home
sleep 1
fi

clear

echo "swapon /dev/vg/swap"
swapon /dev/vg/swap
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "swapon /dev/vg/swap"
swapon /dev/vg/swap
sleep 1
fi

clear

echo "mkfs.fat -F32 /dev/sda2"
mkfs.fat -F32 /dev/sda2
sleep 1
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "mkfs.fat -F32 /dev/sda2"
mkfs.fat -F32 /dev/sda2
sleep 1
fi

clear

echo "pacstrap /mnt base base-devel linux-lts linux-lts-headers linux-firmware mkinitcpio lvm2 nano dhcpcd wpa_supplicant git"
pacstrap -i /mnt base base-devel linux-lts linux-lts-headers linux-firmware mkinitcpio lvm2 nano dhcpcd wpa_supplicant git

sleep 3

clear

echo "genfstab -U /mnt >> /mnt/etc/fstab"
genfstab -U /mnt >> /mnt/etc/fstab

sleep 3
clear

echo "nano /mnt/etc/fstab"
nano /mnt/etc/fstab

clear

echo "arch-chroot /mnt"
arch-chroot /mnt