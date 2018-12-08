hoodanielc dotfiles
================

I prefer to use an existing arch installation when installing arch. But this should also work with the ISO.

```bash
# set a font
sudo pacman -S terminus-font
setfont ter-v32n

# format your hard drive and mount 
sudo gdisk /dev/sdc
sudo cryptsetup -y -v luksFormat /dev/sdc2
sudo cryptsetup open /dev/sdc2 darkroot 
sudo mkfs.ext4 /dev/mapper/darkroot
sudo mount /dev/mapper/darkroot /mnt
sudo mkfs.vfat /dev/sdc1
sudo mkdir /mnt/boot
sudo mount /dev/sdc1 /mnt/boot

# install the basics
sudo pacman -S arch-install-scripts
sudo pacstrap /mnt base base-devel wpa_supplicant terminus-font
sudo arch-chroot /mnt
bootctl install

# we are going to need this for later
blkid
# add 'encrypt' right before fsck in mkinitcpio.conf e.g.
# HOOKS=(base udev autodetect modconf block filesystems keyboard encrypt fsck)
vim /etc/mkinitcpio.conf

# Modify loader.conf to be something like the following. note the default value
# timeout 3
# default arch
vim /boot/loader/loader.conf

# modify recovery.conf. replace uuid-from-blkid with output from blkid command

# title Arch ARCH
# linux /vmlinuz-linux
# initrd /initramfs-linux.img
# options rw cryptdevice=UUID=<uuid-from-blkid>:darkroot root=/dev/mapper/darkroot
vim /boot/loader/entries/recovery.conf
mkinitcpio -p linux

# use that beautiful terminus font forever by adding /etc/vconsole.conf
# FONT=ter-v32n
nano /etc/vconsole

# remember the disk password and change the root password!
reboot
```

After booting, installing the following packages should work.

```bash
pacman -S \
                    xorg-server \
                    nvidia \
                    xorg-server bspwm sxhkd \
                    xorg-server bspwm sxhkd xscreensaver dmenu \
                    git \
                    sxhkd \
                    feh \
                    xorg-xrdb \
                    xorg-xmodmap \
                    xorg-xsetroot \
                    xorg-xinit \
                    chromium \
                    ttf-droid \
                    zsh \
                    terminator \
                    openssh \
                    docker \
                    python \
                    glances \
                    firefox \
                    intel-ucode \
                    net-tools \
                    ppp \
                    docker-compose \
                    arch-install-scripts \
                    nautilus \
                    htop \
                    whois \
                    unzip \
                    linux-headers \
                    wireshark-gtk \
                    ttf-roboto \
                    ttf-hack
```

That is it. That's everything I need.
