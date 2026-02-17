# Quick Reference - Debian 13 Setup Script

## Installation

```bash
# Make executable
chmod +x fresh_setup_improved.sh

# Run script (will ask for sudo password once)
./fresh_setup_improved.sh
```

## Post-Installation Tasks

### 1. Log Out and Back In
Required for group changes to take effect:
```bash
# Save your work, then:
logout
# or
exit
```

### 2. Create Kanata Configuration

Create your keyboard remapping config:
```bash
nano ~/.config/kanata/kanata.kbd
```

Example minimal config:
```lisp
(defsrc
  caps a s d f
)

(deflayer base
  esc a s d f
)
```

Start the service:
```bash
systemctl --user start kanata.service
systemctl --user status kanata.service
```

### 3. Verify Installation

Check each component:
```bash
# Homebrew
brew --version

# Fonts
fc-list | grep -i "Nerd Font"

# Firewall
sudo ufw status verbose

# fail2ban
sudo fail2ban-client status
sudo fail2ban-client status sshd

# Groups
groups
# Should see: input, uinput

# Flatpak
flatpak list

# Snap
snap list

# ble.sh (open new terminal)
# Should see syntax highlighting
```

## Useful Commands

### Kanata Management
```bash
# Start
systemctl --user start kanata.service

# Stop
systemctl --user stop kanata.service

# Restart
systemctl --user restart kanata.service

# Check status
systemctl --user status kanata.service

# View logs
journalctl --user -u kanata.service -f
```

### Firewall Management
```bash
# Status
sudo ufw status verbose

# Add rule
sudo ufw allow 8080/tcp

# Delete rule
sudo ufw delete allow 8080/tcp

# Enable/disable
sudo ufw enable
sudo ufw disable
```

### fail2ban Management
```bash
# Status
sudo fail2ban-client status

# Status for specific jail
sudo fail2ban-client status sshd

# Unban IP
sudo fail2ban-client set sshd unbanip 192.168.1.100

# Show banned IPs
sudo fail2ban-client status sshd | grep "Banned IP"
```

### Package Managers

#### APT (System)
```bash
sudo apt update
sudo apt upgrade
sudo apt install package-name
```

#### Homebrew
```bash
brew update
brew upgrade
brew install package-name
brew list
```

#### Flatpak
```bash
flatpak update
flatpak install flathub app.id
flatpak list
flatpak run app.id
```

#### Snap
```bash
sudo snap refresh
sudo snap install app-name
sudo snap list
```

## Customization

### Add More Packages to Script
Edit `fresh_setup_improved.sh`, find `update_system()` function:
```bash
sudo apt install -y \
    your-package \
    another-package
```

### Disable a Section
Comment out in `main()` function:
```bash
# install_snap  # Disabled
```

### Change Fonts
Edit `install_fonts()` function, add:
```bash
"${USER_HOME}/.local/bin/getnf" -i FontName
```

## Troubleshooting

### Script Issues
```bash
# Check syntax
bash -n fresh_setup_improved.sh

# Run with debug output
bash -x fresh_setup_improved.sh
```

### Kanata Not Working
```bash
# Check service status
systemctl --user status kanata.service

# View logs
journalctl --user -u kanata.service

# Check groups (need to log out/in first)
groups | grep -E 'input|uinput'

# Verify uinput module
lsmod | grep uinput

# Manual test
/home/linuxbrew/.linuxbrew/bin/kanata --cfg ~/.config/kanata/kanata.kbd
```

### Homebrew Issues
```bash
# Diagnose
brew doctor

# Reload shell environment
source ~/.bashrc

# Update Homebrew
brew update
```

### Permission Denied
```bash
# Check file permissions
ls -la filename

# Make executable
chmod +x filename

# Check group membership
groups
```

## Security Notes

### SSH Protection
- fail2ban monitors SSH attempts
- UFW rate-limits SSH connections (port 22)
- Default firewall policy: deny incoming

### Firewall Ports Open
- 22 (SSH) - Rate limited
- 80 (HTTP)
- 443 (HTTPS)

### Check Security Status
```bash
# Firewall
sudo ufw status verbose

# fail2ban
sudo fail2ban-client status sshd

# Open ports
sudo ss -tulpn
```

## Backup Important Files

Before major changes:
```bash
# Kanata config
cp ~/.config/kanata/kanata.kbd ~/.config/kanata/kanata.kbd.backup

# Bashrc
cp ~/.bashrc ~/.bashrc.backup

# Firewall rules
sudo ufw status numbered > ufw_rules_backup.txt
```

## Getting Help

### Documentation Links
- Kanata: https://github.com/jtroo/kanata
- ble.sh: https://github.com/akinomyoga/ble.sh
- UFW: https://help.ubuntu.com/community/UFW
- fail2ban: https://www.fail2ban.org/

### System Logs
```bash
# System log
sudo journalctl -xe

# Specific service
sudo journalctl -u service-name

# Follow logs
sudo journalctl -f
```

### Community Support
- Debian Forums: https://forums.debian.net/
- Debian Wiki: https://wiki.debian.org/
- Stack Exchange: https://unix.stackexchange.com/

## Environment Variables

After installation, these are set in `~/.bashrc`:
```bash
# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ble.sh
source ~/.local/share/blesh/ble.sh
```

Reload with:
```bash
source ~/.bashrc
```

## Maintenance

### Weekly
```bash
# Update all package managers
sudo apt update && sudo apt upgrade -y
brew update && brew upgrade
flatpak update -y
sudo snap refresh
```

### Monthly
```bash
# Clean package cache
sudo apt autoremove
sudo apt autoclean
brew cleanup

# Check security updates
sudo apt list --upgradable
```

### As Needed
```bash
# Review fail2ban bans
sudo fail2ban-client status sshd

# Review firewall logs
sudo grep UFW /var/log/syslog

# Check disk space
df -h
```
