#!/bin/bash

nano /etc/locale.gen
locale-gen

nano /etc/hostname

nano /etc/hosts

clear

echo "Add lvm2 encrypt in The HOOKS"
sleep 10

nano /etc/mkinitcpio.conf

mkinitcpio -p linux

pacman -S grub intel-ucode efibootmgr

echo "GRUB_ENABLE_CRYPTODISK=y"
sleep 5
nano /etc/default/grub

clear

mkdir /boot/efi
mount /dev/sda2 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --no-nvram --removable
grub-mkconfig -o /boot/grub/grub.cfg

sleep 5

mkdir /root/secrets && chmod 700 /root/secrets
head -c 64 /dev/urandom > /root/secrets/crypto_keyfile.bin && chmod 600 /root/secrets/crypto_keyfile.bin
cryptsetup -v luksAddKey -i 1 /dev/nvme0n1p3 /root/secrets/crypto_keyfile.bin
clear

echo "FILES=(/root/secrets/crypto_keyfile.bin)"
sleep 5
nano /etc/mkinitcpio.conf

mkinitcpio -p linux-lts

nano /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

chmod 700 /boot

clear

useradd -m -g users -G wheel -s /bin/bash charlie
sleep 5
passwd
passwd charlie