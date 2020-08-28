# debian
echo "CRYPTSETUP=y" >> /etc/cryptsetup-initramfs/conf-hook

# archlinux
echo "md_crypt UUID=11fdb53b-d45c-4b46-b946-b67de3b448f5 none luks,discard" >> /etc/crypttab

# /etc/grub/default
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=11fdb53b-d45c-4b46-b946-b67de3b448f5:md0_crypt root=/dev/mapper/stable-root resume=UUID=106e8c63-91b2-4c8a-aeff-5c14ea1dfea2"