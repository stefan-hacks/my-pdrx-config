
update && pdrx sync && gitup
sudo reboot
z .pdrx/stefan-hacks/
ll
z config/
ll
z dotfiles/
ll
z fresh_debian_setup/
ll
bat fresh_setup.sh 
cheat scp
scp fresh_setup.sh serveme@192.168.100.16:/home/serveme/
bat fresh_setup.sh
cat .bashrc
grep vi .bashrc
ls -la
z .pdrx/stefan-hacks/
z config/dotfiles/
ll
lla
scp .* serveme@192.168.100.16:/home/serveme/
lla .ssh/
cheat ssh-keygen
ssh-keygen -t ed25519 -f .ssh/serveme
cheat ssh-copy-id
ssh-copy-id -i .ssh/serveme.pub serveme@192.168.100.16
ssh -i .ssh/serveme serveme@192.168.100.16
ssh serveme@192.168.100.16
ssh -i .ssh/serveme serveme@192.168.100.16
cat .bashrc
ssh -i .ssh/serveme serveme@192.168.100.16
