# NAS infra

Base playbook to set up my network attached storage box

```bash
ssh-copy-id `#ip`
ansible-playbook master.yml -e -e ansible_host=`#ip`
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
