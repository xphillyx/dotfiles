dotfiles
========

Install on your own system, or via the official iso image.

```bash
# set a font
sudo pacman -S terminus-font
setfont ter-v32n

# format your and mount your partitions. This guide
# mounts the root folder in /mnt. there are many guides
# out there describing how to do this. Try to find a credible
# one. This guide uses a simple boot and root partition After
# partition is mounted at /mnt, continue

# install the basics
sudo pacman -S arch-install-scripts
sudo pacstrap /mnt base base-devel terminus-font
sudo arch-chroot /mnt

# Here is where you want to install your bootloader. Also
# many guides out there about this. Find one that works for
# your hardware.

# use that beautiful terminus font forever by adding /etc/vconsole.conf
# FONT=ter-v32n
nano /etc/vconsole

# uncomment en_US.UTF-8 UTF-8 in /etc/locale.gen
vim /etc/locale.gen
locale-gen

# remember the disk password and change the root password!
```

# Install Packages

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
                    ttf-roboto \
                    ttf-hack
```

- Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- Optional [post installation steps](https://wiki.archlinux.org/index.php/general_recommendations)
- Optional [nvidia wiki](https://wiki.archlinux.org/index.php/NVIDIA)
- Optional `sudo nvidia-xconfig` will automatically configure X11 config if you have an nvidia card

That is it. That's everything I need.
