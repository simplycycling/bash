#!/usr/bin/env bash
parted --script /ev/nvme0n1 \
  mklabelgpt \
  mkpart ESP fat32 0% 513MiB \
  set 1 boot on \
  mkpart primary ext4 513MiB 30GiB \
  mkpart primary linux-swap 30GiB 38GiB \
  mkpart primary ext4 38GiB 100%
mkfs.ext4 /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p4
mkfs.fat -F32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p3
swapon /dev/nvme0n1p3
mount /dev/nvme0n1p2 /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
mkdir -p /mnt/home
mount /dev/nvme0n1p4 /mnt/home
pacstrap -i /mnt base base-devel
genfstab -U /mnt > /mnt/etc/fstab
arch-chroot /mnt /bin/bash
bootctl --path=/boot install
echo "default arch" > /boot/loader/loader.conf
echo "timeout 1" >> /boot/loader/loader.conf
echo "editor 0" >> /boot/loader/loader.conf
$PARTID blkid -s PARTUUID -o value /dev/nvme0n1p2 
echo "title Arch Linux" > /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo 'options root=PArtUUID="$PARTID" rw' >> /boot/loader/entries/arch.conf
bootctl update

