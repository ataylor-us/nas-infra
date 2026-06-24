# NAS infra

Base playbook to set up my NAS (network attached storage) box

A [ZFS](https://github.com/openzfs/zfs) mirror (RAID1) is shared over NFS and Samba for various services in my homelab such as Time Machine backups, storage for my [frontend](https://github.com/ataylor-us/nas-infra) box, and more.

## Running

```bash
ssh-copy-id `#ip`
ansible-playbook master.yml -e ansible_host=`#ip` --skip-tags after-zfs
# build & install zfs packages manually, reboot, then
just
```
## Hardware

Using the [Beelink Mini PC, ME Pro](https://www.bee-link.com/products/beelink-me-pro), with 2x14TB drives + ZFS.

## Installation

Used `archinstall`.  Select linux-lts kernel. Select Minimal packages & choose NetworkManager during installation. chroot in after installing and enable the sshd service.

Base packages:
```json
    "packages": [
        "intel-ucode",
        "linux-firmware",
        "neovim",
        "openssh",
        "python"
    ],
```

Firewall rules (& drift management) are handled externally by [OpenVox](https://voxpupuli.org/openvox/).

## Manual Steps

Because of recent supply chain attacks, I am taking the precaution to no longer use an AUR helper and am limiting my reliance on AUR packages.

The following are built manually with `makepkg -si`, with the updated PKGBUILD reviewed before each build:

+ [autofs](https://aur.archlinux.org/packages/autofs)
+ [zfs-linux-lts](https://aur.archlinux.org/packages/zfs-linux-lts)
+ [zfs-utils](https://aur.archlinux.org/packages/zfs-utils)
