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

echo "/etc/mkinitcpio.conf"
echo "Add lvm2 encrypt keyboard --> HOOKS()"
read -p "Continues? " ans
if [ $ans == 'y']; then
nano /etc/mkinitcpio.conf
fi

clear

mkinitcpio -p linux-lts

clear

echo "Password for root"
passwd

echo "Create user"
echo "Enter a name for user: " na
useradd -m -g users -G wheel -s /bin/bash $na

sleep 5

clear

pacman -S grub

echo "GRUB_ENABLE_CRYPTODISK=y"
read -p "Continues? " ans
if [ $ans == 'y']; then
nano /etc/default/grub
fi

clear

blkid
echo ""
echo ""
read -p "Continues? " ans
if [ $ans == 'y']; then
clear
fi


echo "... cryptdevice=UUID=xxx:cryptlvm root=/dev/vg/root ..."
read -p "Continues? " ans
if [ $ans == 'y']; then
nano /etc/default/grub
fi

pacman -S efibootmgr

clear

echo "Mount EFI"
echo "Install Grub"
mkdir /boot/efi
mount /dev/sda2 /boot/efi
grub-install --target=x86_64-efi --botloader-id=GRUB --efi-directory=/boot/efi --no-nvram --removable

read -p "Continues? " ans
if [ $ans == 'y']; then
pacman -S intel-ucode
fi

clear

echo "Generate GRUB's configuration file"
grub-mkconfig -o /boot/grub/grub.cfg

sleep 10

clear

echo "Create a keyfile and add it as LUKS key"
mkdir /root/secrets && chmod 700 /root/secrets

head -c 64 /dev/urandom > /root/secrets/crypto_keyfile.bin && chmod 600 /root/secrets/crypto_keyfile.bin

sleep 10

echo "luksAddKey"
cryptsetup -v luksAddKey -i 1 /dev/sda3 /root/secrets/crypto_keyfile.bin

sleep 10

echo "FILES=(/root/secrets/crypto_keyfile.bin)"
read -p "Continues? " ans
if [ $ans == 'y']; then
nano /etc/mkinitcpio.conf
fi

clear

mkinitcpio -p linux

echo "... cryptkey=rootfs:/root/secrets/crypto_keyfile.bin"
read -p "Continues? " ans
if [ $ans == 'y']; then
nano /etc/default/grub
fi

clear

echo "Grub"
grub-mkconfig -o /boot/grub/grub.cfg
read -p "Continues? " ans
if [ $ans == 'y']; then
chmod 700 /boot
fi

echo "end!"
