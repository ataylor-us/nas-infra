default:
    ansible-galaxy install -r requirements.yml
    ansible-playbook master.yml

check:
    ansible-galaxy install -r requirements.yml
    ansible-playbook --check --skip-tags tailscale master.yml

# Uses a different hostkey than normal boot, so hostkey should be stored in a different file
unlock:
    -ssh -o UserKnownHostsFile=~/.ssh/known_hosts_luks root@nas.internal
