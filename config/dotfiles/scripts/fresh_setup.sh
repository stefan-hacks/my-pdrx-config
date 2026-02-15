# mkdir .local/bin/
mkdir -p .local/bin/

# update debian repo
sudo sed -i '/^deb / s/$/ contrib non-free/' /etc/apt/sources.list
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y nala stow git gh curl gawk cmake "linux-headers-$(uname -r)" build-essential kitty dkms

# Section: Remove Bloatware
sudo apt purge -y audacity gimp gnome-games libreoffice*

# Improve sudo password prompt
echo 'Defaults passprompt="[sudo] password for %u:  "' | sudo tee /etc/sudoers.d/00_prompt_lock >/dev/null

# blesh
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git "$HOME/ble.sh"
make -C "$HOME/ble.sh" install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >>~/.bashrc

# Section: Font Installation
log "Installing Nerd Font..."
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i NerdFontsSymbolsOnly
getnf -i Hack
getnf -i SourceCodePro
getnf -i JetBrainsMono

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"" >>~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
ulimit -n 20000
brew install gcc kanata

# flatpak and flathub store
sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# snap-store
sudo apt install -y snapd
source "$HOME/.bashrc"
sudo snap install snapd
sudo systemctl enable --now snapd apparmor
sudo snap install snap-store

# fail2ban
sudo apt install -y fail2ban python3-systemd
sudo cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i '/\[sshd\]/,/enabled/s/^enabled.*/enabled = true/;/\[sshd\]/,/enabled/s/^backend.*/backend = systemd/' /etc/fail2ban/jail.local
sudo systemctl enable fail2ban.service
sudo systemctl start fail2ban.service

# install ufw
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# Set up Kanata keyboard remapper
sudo groupadd -f uinput
sudo usermod -aG input "$USER"
sudo usermod -aG uinput "$USER"
echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/99-input.rules >/dev/null
sudo udevadm control --reload-rules && sudo udevadm trigger
sudo modprobe uinput

mkdir -p ~/.config/systemd/user
cat <<EOF >~/.config/systemd/user/kanata.service
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:$HOME/.cargo/bin
Environment=DISPLAY=:0
Type=simple
ExecStart=/usr/bin/sh -c "exec /home/linuxbrew/.linuxbrew/bin/kanata --cfg /home/$USER/.config/kanata/kanata.kbd"
Restart=no

[Install]
WantedBy=default.target
EOF

systemctl --user daemon-reload
systemctl --user enable kanata.service
systemctl --user start kanata.service
