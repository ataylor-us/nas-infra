default: install
    ansible-playbook master.yml

install:
    ansible-galaxy install -r requirements.yml
    pre-commit install

check: install
    ansible-playbook --check --skip-tags tailscale master.yml

# Uses a different hostkey than normal boot, so hostkey should be stored in a different file
unlock:
    -ssh -o UserKnownHostsFile=~/.ssh/known_hosts_luks root@nas.internal
