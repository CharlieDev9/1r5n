sudo pacman -Ss xf86-video-amdgpu
sudo pacman -S mesa xorg xorg-server plasma alsa-utils vulkan-swrast vulkan-tools alsa-firmware alsa-plugins firefox konsole dolphin vlc mpv inkscape telegram-desktop gwenview kdenlive gparted htop gvfs-mtp wget ark unrar unzip p7zip

sudo pacman -S mesa xorg xorg-server xorg-xinit alsa-utils vulkan-swrast vulkan-tools alsa-firmware alsa-plugins firefox konsole dolphin vlc telegram-desktop gwenview gparted htop gvfs-mtp wget ark unrar unzip p7zip

sudo pacman -S i3-gaps neofetch fish dmenu flameshot urxvt htop sddm nitrogen picom


sudo systemctl enable sddm

git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si
cd


#git clone https://aur.archlinux.org/figma-linux.git
#cd figma-linux
#makepkg -si
#cd


git clone https://aur.archlinux.org/lightly-qt.git
cd lightly-qt
makepkg -si
cd


git clone https://aur.archlinux.org/aic94xx-firmware.git
cd aic94xx-firmware
makepkg -si
cd


git clone https://aur.archlinux.org/wd719x-firmware.git
cd wd719x-firmware
makepkg -si
cd


git clone https://aur.archlinux.org/latte-dock-git.git
cd latte-dock-git
makepkg -si
cd


#git clone https://aur.archlinux.org/protonvpn-cli-ng.git
#cd protonvpn-cli-ng
#makepkg -si
#cd


#git clone https://aur.archlinux.org/windscribe-cli.git
#cd windscribe-cli
#makepkg -si
#cd

cd /home/charlie/Charlie/Apps
sudo chmod +x ./Xdm.sh
sudo ./Xdm.sh

wget https://mail.tutanota.com/desktop/tutanota-desktop-linux.AppImage
#sudo chmod +x ./tutanota-desktop-linux.AppImage
