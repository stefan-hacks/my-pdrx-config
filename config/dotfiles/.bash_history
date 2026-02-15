sudo sed -i '/^deb / s/$/ contrib non-free/' /etc/apt/sources.list
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y nala stow git gh curl gawk cmake "linux-headers-$(uname -r)" build-essential kitty dkms
sudo apt purge -y audacity gimp gnome-games libreoffice* stow
echo 'Defaults passprompt="[sudo] password for %u:  "' | sudo tee /etc/sudoers.d/00_prompt_lock >/dev/null
sudo nala install firmware-realtek -y
sudo nala install linux-headers-amd64 && sudo dkms autoinstall
sudo apt install -y fail2ban python3-systemd
sudo cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i '/\[sshd\]/,/enabled/s/^enabled.*/enabled = true/;/\[sshd\]/,/enabled/s/^backend.*/backend = systemd/' /etc/fail2ban/jail.local
sudo systemctl enable fail2ban.service
sudo systemctl start fail2ban.service
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"" >>~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
ulimit -n 20000
brew install gcc
sudo cp "$HOME/dotfiles/custom_tools_and_scripts/bash/fza.sh" /usr/local/bin/fza
sudo cp "$HOME/dotfiles/custom_tools_and_scripts/bash/fzm.sh" /usr/local/bin/fzm
sudo cp "$HOME/dotfiles/custom_tools_and_scripts/bash/gspb.sh" /usr/local/bin/gspb
sudo cp "$HOME/dotfiles/custom_tools_and_scripts/bash/idh.sh" /usr/local/bin/idh
sudo cp "$HOME/dotfiles/custom_tools_and_scripts/bash/uma.sh" /usr/local/bin/uma
sudo cp "$HOME/dotfiles/custom_tools_and_scripts/bash/lsgroups.sh" /usr/local/bin/lsgroups
sudo chown "$USER":"$USER" /usr/local/bin/*
sudo rm -rf /usr/local/bin/gspb 
sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo apt install -y snapd
# shellcheck source=/dev/null
source "$HOME/.bashrc"
sudo snap install snapd
sudo systemctl enable --now snapd apparmor
sudo snap install snap-store
mv dotfiles/Pictures/wallpapers/ Pictures/
git clone https://github.com/vinceliuice/grub2-themes.git "$HOME/gitprojects/grub2-themes"
cp "$HOME/Pictures/wallpapers/wallpaper_027.jpg" "$HOME/gitprojects/grub2-themes/background.jpg"
sudo "$HOME/gitprojects/grub2-themes/install.sh" -s 1080p -b -t whitesur
echo $PATH
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
getnf -i NerdFontsSymbolsOnly
getnf -i Hack
getnf -i SourceCodePro
getnf -i JetBrainsMono

sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
cd dotfiles/
mv .config/* ~/.config/
ls -la
mv .b* .inputrc .mostrc .nanorc .vimrc ..
brew info imagemagick
brew install imagemagick-full
brew remove imagemagick-full
cd
mkdir gitprojects
ls -l
git clone https://github.com/vinceliuice/grub2-themes.git "$HOME/gitprojects/grub2-themes"
cp "$HOME/Pictures/wallpapers/wallpaper_027.jpg" "$HOME/gitprojects/grub2-themes/background.jpg"
sudo "$HOME/gitprojects/grub2-themes/install.sh" -s 1080p -b -t whitesur
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=2/' /etc/default/grub
sudo update-grub
sudo update-initramfs -u -k all
dconf load / <"$HOME/dotfiles/backups/gnome_settings.bak"
sudo nala install bat
brew install bat-extras
brew install grc
sudo nala install lolcat figlet fastfetch cpufetch btop -y
brew install kew
eval -- $'sudo groupadd -f uinput\nsudo usermod -aG input "$USER"\nsudo usermod -aG uinput "$USER"\necho \'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"\' | sudo tee /etc/udev/rules.d/99-input.rules >/dev/null\nsudo udevadm control --reload-rules && sudo udevadm trigger\nsudo modprobe uinput\n\nmkdir -p ~/.config/systemd/user\ncat <<EOF >~/.config/systemd/user/kanata.service\n[Unit]\nDescription=Kanata keyboard remapper\nDocumentation=https://github.com/jtroo/kanata\n\n[Service]\nEnvironment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:$HOME/.cargo/bin\nEnvironment=DISPLAY=:0\nType=simple\nExecStart=/usr/bin/sh -c "exec /home/linuxbrew/.linuxbrew/bin/kanata --cfg /home/$USER/.config/kanata/kanata.kbd"\nRestart=no\n\n[Install]\nWantedBy=default.target\nEOF\n\nsystemctl --user daemon-reload\nsystemctl --user enable kanata.service\nsystemctl --user start kanata.service'
sudo nala install gnome-shell-extension-manager -y
z dotfiles/
ll
brew install eza
ll
mv guides/ ~/Documents/
mv resume/ ~/Documents/
mv mind_maps/ ~/Documents/
cd
rm -rf dotfiles/
sudo reboot
sudo nala install libgnome-menu-3-0, gir1.2-gmenu-3.0
sudo nala install gir1.2-gmenu-3.0
sudo apt install gnome-shell-extension-manager gir1.2-gtop-2.0 lm-sensors
nala search gmenu
sudo nala install yaru*
ll .config/
rm -rf .config/ghostty/
brew install yazi
sudo nala install apparmor-profiles
nala search apparmor
sudo nala install apparmor-utils 
sudo nala install vlc mpv
sudo nala install tor-browser
nala search tor
sudo nala install torbrowser-launcher -y
sudo nala install ffmpeg
sudo nala install guvcview -y
sudo nala install gdebi
gsettings set org.gnome.desktop.interface enable-animations false
sudo nala install zram-tools preload
sudo nala install arp-scan -y
source .bashrc
git clone https://github.com/JB63134/bash_ct.git
z bash_ct/
ll
chmod +x ct.sh 
sudo mv ct.sh /usr/local/bin
cd
rm -rf bash_ct/
source .bashrc
ll /usr/local/bin/
cd /usr/local/bin/
sudo mv ct.sh ct
ll
sudo nala install vim
nala show neovim
brew info neovim
brew install neovim
nvim .bashrc
source .bashrc
nala search joplin
lla
vim .bashrc
alias update
which figlet
which lolcat
sudo nala install cava plocate -y
sudo usermod -aG vboxusers stefan-hacks 
sudo reboot
nala search joplin
lla
vim .bashrc
alias update
which figlet
which lolcat
sudo nala install cava plocate -y
sudo usermod -aG vboxusers stefan-hacks 
sudo reboot
sudo nala install gpaste-2 -y
eval -- $'git clone https://github.com/stefan-hacks/pdrx.git\ncd pdrx\nchmod +x pdrx\n./pdrx --install\nsource ~/.bashrc\npdrx init'
z
ll
lla
z .config/
ll
cat dconf/user 
ll
