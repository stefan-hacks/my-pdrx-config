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
