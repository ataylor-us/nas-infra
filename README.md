# NAS infra

Base playbook to set up my NAS (network attached storage) box

A [ZFS](https://github.com/openzfs/zfs) mirror (RAID1) is shared over NFS and Samba for various services in my homelab such as storage for my [frontend](https://github.com/ataylor-us/frontend-infra) box, and more.

## Running

```bash
ssh-copy-id `#ip`
ansible-playbook master.yml -e ansible_host=`#ip` --skip-tags after-zfs
# build & install zfs packages manually, reboot, then
just
```
## Hardware

Using the [Beelink Mini PC, ME Pro](https://www.bee-link.com/products/beelink-me-pro), with 2x14TB drives, plus a 500GB NVMe boot drive.

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

## Versions

[Renovate](https://github.com/renovatebot/renovate) is used to make PRs for containers, Ansible Galaxy collections, and AUR packages.  Other updates are handled manually by the package manager.

## Manual Steps

Currently figuring out an automated process with these packages. They are built manually with `makepkg -si`, with the updated PKGBUILD reviewed before each build:

+ [zfs-dkms](https://aur.archlinux.org/packages/zfs-dkms)
+ [zfs-utils](https://aur.archlinux.org/packages/zfs-utils)

