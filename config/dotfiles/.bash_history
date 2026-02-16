pdrx init
pdrx status
pdrx sync
z
pdrx track .b*
pdrx track .[i-n]*
pdrx track .vimrc 
z .config/
pdrx track atuin/config.toml btop/btop.conf fastfetch/config.jsonc helix/config.toml kanata/kanata.kbd kitty/* nvim/* terminator/config ulauncher/* ulauncher/ext_preferences/* wezterm/wezterm.lua yazi/theme.toml zellij/config.kdl 
pdrx track starship.toml 
z
z .pdrx/
pdrx backup
pdrx sync-dektop
pdrx update
cat > ~/.pdrx/.gitignore << 'EOF'
# Exclude backups (optional - they can be large)
backups/

# Or include everything and exclude only huge dirs
# backups/*/
EOF
git add .
git init
sudo nala install gh
gh auth login
tldr --update
cheat git config
git config --global user.name "stefan-hacks"
git config --global user.email "stefanmrobertson@gmail.com"
git add .
git commit -m "initial pdrx config"
git branch -M main
git remote add origin https://github.com/stefan-hacks/my-pdrx-config.git
git push -u origin main
pdrx untrack ~/.bash_history
gitup
brew install onefetch lazygit gitleaks
pdrx generations
pdrx list
pdrx sync
update
pdrx clean
pdrx sync
pdrx status
pdrx backup inital_install
pdrx status
pdrx generations
pdrx -h
pdrx sync
lsmod | grep kvm  # Should return nothing

sudo nano /etc/modprobe.d/blacklist-kvm.conf

alias update
update
mv ~/Downloads/icon.png ~/Pictures/
pdrx track ~/Pictures/icon.png 
pdrx track ~/Pictures/wallpapers/*
pdrx sync
pdrx backup upgrade
gitup
sudo reboot
pdrx init
pdrx status
pdrx sync
z
pdrx track .b*
pdrx track .[i-n]*
pdrx track .vimrc 
z .config/
pdrx track atuin/config.toml btop/btop.conf fastfetch/config.jsonc helix/config.toml kanata/kanata.kbd kitty/* nvim/* terminator/config ulauncher/* ulauncher/ext_preferences/* wezterm/wezterm.lua yazi/theme.toml zellij/config.kdl 
pdrx track starship.toml 
z
z .pdrx/
pdrx backup
pdrx sync-dektop
pdrx update
eval -- $'cat > ~/.pdrx/.gitignore << \'EOF\'\n# Exclude backups (optional - they can be large)\nbackups/\n\n# Or include everything and exclude only huge dirs\n# backups/*/\nEOF'
git add .
git init
sudo nala install gh
gh auth login
tldr --update
cheat git config
git config --global user.name "stefan-hacks"
git config --global user.email "stefanmrobertson@gmail.com"
git add .
git commit -m "initial pdrx config"
git branch -M main
git remote add origin https://github.com/stefan-hacks/my-pdrx-config.git
git push -u origin main
pdrx untrack ~/.bash_history
gitup
brew install onefetch lazygit gitleaks
pdrx generations
pdrx list
pdrx sync
update
pdrx clean
pdrx sync
pdrx status
pdrx backup inital_install
pdrx status
pdrx generations
pdrx -h
pdrx sync
eval -- $'lsmod | grep kvm  # Should return nothing\n'
eval -- $'sudo nano /etc/modprobe.d/blacklist-kvm.conf\n'
alias update
update
mv ~/Downloads/icon.png ~/Pictures/
pdrx track ~/Pictures/icon.png 
pdrx track ~/Pictures/wallpapers/*
pdrx sync
pdrx backup upgrade
gitup
sudo reboot
z
z gitprojects/tools/pdrx/
man rg 
brew install rg
man rg
\man rg
alias man
which bat
sudo ln -s /usr/bin/batcat /usr/bin/bat
man rg
gitup
z
z gitprojects/tools/pdrx/
ll
sudo ./install_manpage.sh --system
man pdrx
ll
rm -rf ~/.local/bin/pdrx 
./pdrx --install
cat pdrx.1 
z .pdrx/
pdrx sync
gitup
z
z gitprojects/
ll
mkdir tools apps 
mv grub2-themes/ tools/
ll
z tools/
ll
git clone https://github.com/stefan-hacks/pdrx.git
z pdrx/
ll
z
z .pdrx/
pdrx sync-desktop
gitup
pdrx sync
pdrx --help
pdrx search shellcheck
brew install shellcheck
pdrx clean
pdrx search shellcheck
pdrx search shellcheck --all
pdrx search shellcheck
which pdrx
z .pdrx/
pdrx sync
gitup
z
z gitprojects/
ll
mkdir tools apps 
mv grub2-themes/ tools/
ll
z tools/
ll
git clone https://github.com/stefan-hacks/pdrx.git
z pdrx/
ll
z
z .pdrx/
pdrx sync-desktop
gitup
pdrx sync
pdrx --help
pdrx search shellcheck
brew install shellcheck
pdrx clean
pdrx search shellcheck
pdrx search shellcheck --all
pdrx search shellcheck
which pdrx
z .pdrx/
pdrx init
pdrx status
pdrx -h
pdrx -v
pdrx search shellcheck
pdrx search cava
pdrx install cava
kew
pdrx sync
pdrx list
pdrx backup latest
pdrx generations
pdrx sync
pdrx generations
pdrx clean
pdrx clean 1-3
pdrx generations
pdrx sync-desktop
pdrx update
z
z gitprojects/tools/pdrx/
gitup
ll
sudo ./install_manpage.sh --system
rm -rf ~/.local/bin/pdrx
./pdrx --install
pdrx -v
man pdrx
which pdrx
whereis pdrx
ct pdrx
z /usr/local/share/man
ll
z man1/
ll
cat pdrx.1
z
cd -
ll
sudo rm -rf pdrx.1 
z
z gitprojects/tools/pdrx/
sudo ./install_manpage.sh --system
man pdrx
sudo rm -rf /usr/local/share/man/man1/pdrx.1
pdrx -h
cat pdrx.1
pdrx -v
pdrx -h
rm -rf ~/.local/bin/pdrx
lla
sudo ./install_manpage.sh --system
./pdrx --install
gitup
man pdrx
sudo rm -rf /usr/local/share/man/man1/pdrx.1
ll ~/.local/share/man/
z ~/.local/share/man/
ll
z man1/
ll
rm pdrx.1 
z
z gitprojects/tools/pdrx/
pdrx -h
sudo ./install_manpage.sh --system
man pdrx
./install_manpage.sh 
man pdrx
gitup
z
z .pdrx/
ll
pdrx init
pdrx status
pdrx update
pdrx upgrade
gitup
lta
pdrx sync-desktop
pdrx sync
pdrx generations
gitup
gitleaks
gitleaks dir
onefetch
z
z gitprojects/tools/pdrx/
nvim README.md 
gitup
nvim README.md
gitup
z
z .pdrx/
pdrx sync
pdrx sync-desktop
pdrx backup ghost
gitup
z
z distro_images/
ll
rm Oracle_VirtualBox_Extension_Pack-7.2.4.vbox-extpack 
ll ~/Downloads/
mv ~/Downloads/Oracle_VirtualBox_Extension_Pack-7.2.6.vbox-extpack .
z
z .pdrx/
pdrx export > config.tar.gz
gitup
ll
rm -rf config.tar.gz 
gitup
lla
gitup
ll
lazygit
gitup
z
ll
mkdir scripts
z scripts/
nvim install-package_managers.sh
mv install-package_managers.sh fresh_setup.sh
chmod +x fresh_setup.sh 
z
pdrx track ~/scripts/fresh_setup.sh 
z .pdrx/
gitup
z
ll
z scripts/
ll
pdrx untrack ~/scripts/fresh_setup.sh
mv ~/Downloads/fresh_setup_improved.sh .
ll
rm fresh_setup.sh 
mv fresh_setup_improved.sh fresh_setup.sh 
chmod +x fresh_setup.sh
pdrx track ~/scripts/fresh_setup.sh
z
z .pdrx/
gitup
z
z scripts/
nvim fresh_setup.sh 
z
z .pdrx/
gitup
pdrx sync
z
z gitprojects/tools/pdrx/
nvim README.md
gitup
nvim README.md
gitup
nvim README.md
gitup
nvim README.md
gitup
pdrx -v
pdrx search shellcheck
pdrx search cava
pdrx install cava
kew
pdrx sync
pdrx list
pdrx backup latest
pdrx generations
pdrx sync
pdrx generations
pdrx clean
pdrx clean 1-3
pdrx generations
pdrx sync-desktop
pdrx update
z
z gitprojects/tools/pdrx/
gitup
ll
sudo ./install_manpage.sh --system
rm -rf ~/.local/bin/pdrx
./pdrx --install
pdrx -v
man pdrx
which pdrx
whereis pdrx
ct pdrx
z /usr/local/share/man
ll
z man1/
ll
cat pdrx.1
z
cd -
ll
sudo rm -rf pdrx.1 
z
z gitprojects/tools/pdrx/
sudo ./install_manpage.sh --system
man pdrx
sudo rm -rf /usr/local/share/man/man1/pdrx.1
pdrx -h
cat pdrx.1
pdrx -v
pdrx -h
rm -rf ~/.local/bin/pdrx
lla
sudo ./install_manpage.sh --system
./pdrx --install
gitup
man pdrx
sudo rm -rf /usr/local/share/man/man1/pdrx.1
ll ~/.local/share/man/
z ~/.local/share/man/
ll
z man1/
ll
rm pdrx.1 
z
z gitprojects/tools/pdrx/
pdrx -h
sudo ./install_manpage.sh --system
man pdrx
./install_manpage.sh 
man pdrx
gitup
z
z .pdrx/
ll
pdrx init
pdrx status
pdrx update
pdrx upgrade
gitup
lta
pdrx sync-desktop
pdrx sync
pdrx generations
gitup
gitleaks
gitleaks dir
onefetch
z
z gitprojects/tools/pdrx/
nvim README.md 
gitup
nvim README.md
gitup
z
z .pdrx/
pdrx sync
pdrx sync-desktop
pdrx backup ghost
gitup
z
z distro_images/
ll
rm Oracle_VirtualBox_Extension_Pack-7.2.4.vbox-extpack 
ll ~/Downloads/
mv ~/Downloads/Oracle_VirtualBox_Extension_Pack-7.2.6.vbox-extpack .
z
z .pdrx/
pdrx export > config.tar.gz
gitup
ll
rm -rf config.tar.gz 
gitup
lla
gitup
ll
lazygit
gitup
z
ll
mkdir scripts
z scripts/
nvim install-package_managers.sh
mv install-package_managers.sh fresh_setup.sh
chmod +x fresh_setup.sh 
z
pdrx track ~/scripts/fresh_setup.sh 
z .pdrx/
gitup
z
ll
z scripts/
ll
pdrx untrack ~/scripts/fresh_setup.sh
mv ~/Downloads/fresh_setup_improved.sh .
ll
rm fresh_setup.sh 
mv fresh_setup_improved.sh fresh_setup.sh 
chmod +x fresh_setup.sh
pdrx track ~/scripts/fresh_setup.sh
z
z .pdrx/
gitup
z
z scripts/
nvim fresh_setup.sh 
z
z .pdrx/
gitup
pdrx sync
z
z gitprojects/tools/pdrx/
nvim README.md
gitup
nvim README.md
gitup
nvim README.md
gitup
nvim README.md
gitup
