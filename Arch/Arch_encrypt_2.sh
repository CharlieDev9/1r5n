#!/bin/bash

echo "lsblk"
lsblk

sleep 3

echo "nano /etc/locale.gen"
nano /etc/locale.gen
locale-gen

sleep 2

clear

echo "nano /etc/hostname"
nano /etc/hostname

clear

echo "nano /etc/hosts"
nano /etc/hosts

clear

echo "cd arch"
cd arch
echo "cp -r mkinitcpio.conf /etc"
cp -r mkinitcpio.conf /etc
sleep 5


echo "cp -r grub /etc/default"
cp -r grub /etc/default

sleep 5

clear

echo "mkinitcpio -p linux"
mkinitcpio -p linux

sleep 3

clear

pacman -S grub networkmanager intel-ucode efibootmgr dialog

echo "mkdir /boot/EFI"
mkdir /boot/EFI
echo "mount /dev/sad2 /boot/EFI"
mount /dev/sad2 /boot/EFI

sleep 5

clear

echo "grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --no-nvram --removable"
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --no-nvram --removable

read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --no-nvram --removable"
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --no-nvram --removable
sleep 1
fi

clear

echo "grub-mkconfig -o /boot/grub/grub.cfg"
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Do you want try?" tr
if [ $tr == 'y']; then
echo "grub-mkconfig -o /boot/grub/grub.cfg"
grub-mkconfig -o /boot/grub/grub.cfg
sleep 1
fi

clear

echo "mkdir /root/secrets && chmod 700 /root/secrets"
mkdir /root/secrets && chmod 700 /root/secrets
sleep 3

clear

echo "head -c 64 /dev/urandom > /root/secrets/crypto_keyfile.bin && chmod 600 /root/secrets/crypto_keyfile.bin"
head -c 64 /dev/urandom > /root/secrets/crypto_keyfile.bin && chmod 600 /root/secrets/crypto_keyfile.bin
sleep 3

clear

echo "cryptsetup -v luksAddKey -i 1 /dev/nvme0n1p3 /root/secrets/crypto_keyfile.bin"
cryptsetup -v luksAddKey -i 1 /dev/nvme0n1p3 /root/secrets/crypto_keyfile.bin
sleep 3

clear

echo "mkinitcpio -p linux"
mkinitcpio -p linux

echo "chmod 700 /boot"
chmod 700 /boot

echo "passwd"
passwd

sleep 3

useradd -m -g users -G wheel -s /bin/bash charlie
passwd charlie

echo "finish!!!"

