mv Downloads/fresh_setup.sh .
chmod +x fresh_setup.sh 
./fresh_setup.sh 
sudo nala install gdebi
sudo nala install linux-headers-amd64
sudo nala install gnome-shell-extension-manager -y
source .bashrc
brew install kanata starship carapace atuin eza
brew services start atuin
git clone https://github.com/stefan-hacks/my-pdrx-config.git
cd my-pdrx-config/
cd stefan-hacks/
cd config/dotfiles/
mv .config/* ~/.config/
rm .config/atuin/
rm -rf .config/atuin/
mv .config/* ~/.config/
ls -la
cd .config/
ls -la
cd
ls -la .config/
ls -la .config/kitty/
cd -
cd ..
ls -l
ls -la
ls -la scripts/
mv .* ~
rm -rf .config/
mv .* ~
mv ./.* ~
ls -la
cd
ls -la
cat .bashrc
brew install thefuck
brew install zoxide
sudo nala install kitty
gsettings set org.gnome.desktop.interface enable-animations false
sudo apt install libgnome-menu-3-0 gir1.2-gmenu-3.0
sudo apt install gnome-shell-extension-manager gir1.2-gtop-2.0 lm-sensors
sudo reboot
sudo nala install figlet lolcat
brew install bat-extras
brew install grc bat
source .bashrc
sudo nala install vlc mpv ffmpeg -y
sudo nala install guvcview -y
sudo nala install yaru*
dconf load my-pdrx-config/stefan-hacks/config/desktop-export/dconf/user.txt 
dconf load -f  my-pdrx-config/stefan-hacks/config/desktop-export/dconf/user.txt 
sudo reboot
sudo nala install tor-browser-launcher
sudo nala install torbrowser-launcher
sudo nala install gpaste-2 
git clone git clone https://github.com/JB63134/bash_ct.git
git clone https://github.com/JB63134/bash_ct.git .local/bin
git clone https://github.com/JB63134/bash_ct.git .local/bin/
git clone https://github.com/JB63134/bash_ct.git .local/bin/bash_ct
cd .local/bin//bash_ct/
pwd
ls -l
sudo cp ct.sh /usr/local/bin
cd
source .bashrc
which ct
sudo mv /usr/local/bin/ct.sh /usr/local/bin/ct
source .bashrc
which ct
ct ls
update
brew install tealdeer
update
sudo poweroff
tldr --update
cheat dconf
cheat gsettings
eval -- $'brew tap stefan-hacks/pdrx https://github.com/stefan-hacks/pdrx\nbrew install pdrx\n'
brew install neovim
nvim .bashrc
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf .config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim .bashrc
tail .bash_aliases 
nvim .bashrc
gh auth login
git clone https://github.com/stefan-hacks/my-pdrx-config.git .pdrx
z .pdrx/
mkdir stefan-hacks
ll
z
source .bashrc
z .pdrx/
cheat git config
git config --global user.name stefan-hacks
git config --global user.email stefanmrobertson@gmail.com
pdrx init
pdrx sync
pdrx track $HOME/.*
eval -- $'cat > ~/.pdrx/.gitignore << \'EOF\'\n# Exclude backups (optional - they can be large)\nbackups/\n\n# Or include everything and exclude only huge dirs\n# backups/*/\nEOF'
lla
pdrx backup initial
gitup
ll
z
ll
git clone https://github.com/stefan-hacks/dotfiles.git
cd dotfiles/
cd Pictures/
mv wallpapers/ ~/Pictures/
cd ..
ll
rm -rf dotfiles/
ll
lla
rm -rf my-pdrx-config/
pdrx track Pictures/wallpapers/*
z .pdrx/
gitup
pdrx sync
gitup
z
z Downloads/
ll
lla
rm -rf *
z
lla
z .ssh
ll
lla
cat > lin
z
ssh lin@192.168.15.12
ssh -i lin lin@192.168.15.12
z .ssh
ssh -i lin lin@192.168.15.12
chmod 700 lin
ssh -i lin lin@192.168.15.12
cat > lin.pub
mv lin.pub .ssh/
ssh -i lin lin@192.168.15.12
ssh -i .ssh/lin lin@192.168.15.12
mkdir gitprojects
sudo nala install imagemagick 
lla
z
pdrx track .ssh
pdrx track .ssh/*
z .pdrx/
brew install onefetch
sudo nala install fastfetch cpufetch
pdrx update
pdrx sync
gitup
brew install lazygit gitleaks
z
cheat scp
scp -r lin@192.168.15.12:/home/lin/Pictures/*.png /home/stefan-hacks/Pictures/
scp -r lin@192.168.15.12:/home/lin/Pictures/icon.png /home/stefan-hacks/Pictures/
scp -ri .ssh/lin lin@192.168.15.12:/home/lin/Pictures/icon.png /home/stefan-hacks/Pictures/
scp -ri .ssh/lin lin@192.168.15.12:/home/lin/Pictures/*.png /home/stefan-hacks/Pictures/
ff
mkdir distro_images
mv Downloads/Oracle_VirtualBox_Extension_Pack-7.2.6.vbox-extpack distro_images/
lsmod | grep kvm  # Should return nothing
sudo nano /etc/modprobe.d/blacklist-kvm.conf
sudo update-initramfs -u
sudo ufw status
eval -- $'git clone https://github.com/vinceliuice/grub2-themes.git "$HOME/gitprojects/grub2-themes"\ncp "$HOME/Pictures/wallpapers/blur.png" "$HOME/gitprojects/grub2-themes/background.jpg"\nsudo "$HOME/gitprojects/grub2-themes/install.sh" -s 1080p -b -t whitesur'
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=2/' /etc/default/grub
sudo update-grub && sudo update-initramfs -u -k alll
sudo update-grub && sudo update-initramfs -u -k all
pdrx update 
pdrx sync
z .pdrx/
gitup
sudo reboot
brew install gum glow
pdrx sync
cat /etc/default/grub
cat /proc/cmdline
nala show plymouth
eval -- $'sudo nala purge plymouth plymouth-themes\nsudo nala autoremove'
eval -- $'sudo update-initramfs -u\nsudo update-grub\n'
sudo reboot
z .pdrx/
gitup
z
z .pdrx/
gitup
z
pdrx track
whatis rbash
man rbash
sudo nala install speedtest-cli -y
speedtest
gitdiff --help
gitdiff .pdrx/
z .pdrx/
gitup
z
journalctl | fold -w 130 | less
fold --help
journalctl | fold -sw 130 | less
systemctl -a
systemctl -a |fold | less
systemctl -a | nvim 
mkdir stest
ll
rm stest/
pdrx track fresh_setup.sh 
pdrx sync
pdrx backup stefan-hacks
z .pdrx/
gitup
z
whatis csplit
csplit --help
z .pdrx/
gitup
git clone https://github.com/stefan-hacks/my-pdrx-config.git .pdrx
brew install nvim
cd .pdrx/stefan-hacks/
ls -l
cd config/
ls -l
cd dotfiles/
ls -la
cp .b* .inputrc .mostrc .nanorc .vimrc  $HOME
cd
ls -la
cat .bashrc
nvim .bashrc
mkdir -p .pdrx/lin
source .bashrc
sudo nala install figlet lolcat bat
brew install thefuck bat-extras bat gum glow
source .bashrc
pwd
git clone https://github.com/JB63134/bash_ct.git
cd bash_ct/
ls -l
sudo cp ct.sh /usr/local/bin/ct
sudo chmod +x /usr/local/bin/ct
cd -1
ll
rm -rf bash_ct/
ll
lla
cheat git
cheat git config
git config
git config -l
pdrx init
z .pdrx/
pwd
z lin/
pwd
pdrx sync
z
lla
pdrx track .*
pdrx track .ssh/*
pdrx sync
cd -
gitup
git config --global user.email "linnoks80@proton.me"
git config --global user.name "lin"
gitup
pdrx update && pdrx upgrade
z
pwd
pdrx status
pdrx backup lin
z .pdrx/lin/
gitup
sudo reboot
