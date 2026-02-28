
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
sudo apt purge cursor
z .pdrx/
update && pdrx sync && gitup
git pull
git config pull.rebase false
git pull
gitup
z
z .ssh/
ll
ssh-copy-id -i .ssh/serveme.pub serveme@192.168.100.16
cheat ssh-copy-id
cd
ssh-copy-id -i .ssh/serveme.pub serveme@192.168.100.16
ssh-keygen -f '/home/stefan-hacks/.ssh/known_hosts' -R '192.168.100.16'
ssh -i .ssh/serveme serveme@192.168.100.16
nvim lin_discord_token
ll
cat discord
nvim discord
cat lin_discord_token >> discord 
nvim discord
mv discord discord_setup
scp discord_setup  serveme@192.168.100.16:/home/serveme/
cat > new_discord_bot_token
scp new_discord_bot_token serveme@192.168.100.16:/home/serveme/
cat > oath2
scp oath2 serveme@192.168.100.16:/home/serveme/
cat > oathurl
scp oath3 serveme@192.168.100.16:/home/serveme/
scp oathurl serveme@192.168.100.16:/home/serveme/
ll
cat discord
nvim discord
cat lin_discord_token >> discord 
nvim discord
mv discord discord_setup
scp discord_setup  serveme@192.168.100.16:/home/serveme/
cat > new_discord_bot_token
scp new_discord_bot_token serveme@192.168.100.16:/home/serveme/
cat > oath2
scp oath2 serveme@192.168.100.16:/home/serveme/
cat > oathurl
scp oath3 serveme@192.168.100.16:/home/serveme/
scp oathurl serveme@192.168.100.16:/home/serveme/
ollama show
ollama list
ollama ps
ollama stop qwen2.5:1.5b
ollama rm qwen2.5:1.5b
curl -fsSL https://ollama.com/install.sh | sh
ollama pull qwen2.5:1.5b
ollama ps
ollama list
ollama run qwen2.5:1.5b
ollama --help
ssh -i .ssh/serveme serveme@192.168.100.16
z distro_images/
ll
rm -rf debian-13.0.0-amd64-netinst.iso 
mv ~/Downloads/debian-13.3.0-amd64-netinst.iso .
rm -rf debian-13.0.0-amd64-netinst.iso
mv ~/Downloads/debian-13.3.0-amd64-netinst.iso .
ll
z
ll Downloads/
nvim discord
cat discord 
sudo nala install libreoffice
which brew
ll
cat new_discord_bot_token 
z distro_images/
ll
rm -rf debian-13.0.0-amd64-netinst.iso 
mv ~/Downloads/debian-13.3.0-amd64-netinst.iso .
rm -rf debian-13.0.0-amd64-netinst.iso
mv ~/Downloads/debian-13.3.0-amd64-netinst.iso .
ll
z
ll Downloads/
nvim discord
cat discord 
sudo nala install libreoffice
which brew
ll
cat new_discord_bot_token 
sudo apt update && sudo apt upgrade -y
sudo apt install -y podman git curl openssl
podman --version
podman info --format '{{.Host.CgroupsVersion}}'
# Should output: 2
git clone https://github.com/openclaw/openclaw.git
cd openclaw
sudo ./setup-podman.sh --quadlet
free -h
nproc

sudo BUILDAH_LAYERS=true BUILDAH_LOG_LEVEL=debug ./setup-podman.sh --quadlet 2>&1 | tee /tmp/openclaw-build.log
grep -A5 -B2 "ERR_PNPM\|error\|WARN\|fail\|network\|ENOTFOUND\|ECONNREFUSED" /tmp/openclaw-build.log | head -60
sudo apt install -y slirp4netns uidmap pasta
sudo apt install -y slirp4netns uidmap passt
podman run --rm alpine sh -c "wget -qO- https://registry.npmjs.org/ | head -5"
podman system prune -af
sudo ./setup-podman.sh --quadlet

cd
ll
lla
rm -rf openclaw/
# Create config and workspace dirs (these persist across container restarts)
mkdir -p ~/.openclaw
mkdir -p ~/openclaw/workspace

# Generate a secure gateway token and save it
OPENCLAW_GATEWAY_TOKEN=$(openssl rand -hex 32)
echo "OPENCLAW_GATEWAY_TOKEN=$OPENCLAW_GATEWAY_TOKEN" > ~/.openclaw/.env
echo "Your token is: $OPENCLAW_GATEWAY_TOKEN"

# Lock down permissions on the config dir
chmod 700 ~/.openclaw
cat .openclaw/.env 
podman pull ghcr.io/phioranex/openclaw-docker:latest
podman images | grep openclaw
podman run -it --rm \
  -v ~/.openclaw:/home/node/.openclaw:Z \
  -v ~/openclaw/workspace:/home/node/.openclaw/workspace:Z \
  ghcr.io/phioranex/openclaw-docker:latest onboard
# Check the uid of the node user inside the container
podman run --rm ghcr.io/phioranex/openclaw-docker:latest id node

podman run --rm --entrypoint /bin/sh ghcr.io/phioranex/openclaw-docker:latest -c "id node"
sudo chown -R 1000:1000 ~/.openclaw
sudo chown -R 1000:1000 ~/openclaw

ls -la ~ | grep openclaw
podman run -it --rm \
  -v ~/.openclaw:/home/node/.openclaw:Z \
  -v ~/openclaw/workspace:/home/node/.openclaw/workspace:Z \
  ghcr.io/phioranex/openclaw-docker:latest onboard
cheat podman
podman ps -a
podman images
podman rmi d1956871a56e
podman ps
ollama list
ollama ps
ollama images
ollama --help
sudo apt update && sudo apt upgrade -y

# Podman + helpers
sudo apt install -y podman podman-compose uidmap slirp4netns fuse-overlayfs

# Optional but recommended
sudo apt install -y git curl jq
systemctl user.max_user_namespaces
z /etc/sysctl.d/
ll
z
podman info | grep -i rootless
sudo loginctl enable-linger $USER
podman network create openclaw-net
podman network rm openclaw-net

podman network create \
  --driver bridge \
  --subnet 10.89.1.0/24 \
  --gateway 10.89.1.1 \
  --opt "com.docker.network.bridge.name=openclaw0" \
  --dns 1.1.1.1 \
  --dns 8.8.8.8 \
  openclaw-net
podman network inspect openclaw-net | grep -E '"dns"|"subnets"|"ipv6"'
# IP forwarding must be enabled
sysctl net.ipv4.ip_forward
# Should return: net.ipv4.ip_forward = 1

# If it's 0, enable it permanently
echo "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-podman-forward.conf
sudo sysctl -p /etc/sysctl.d/99-podman-forward.conf
echo -n "ebb0959865d543538a2e8107bb9cbd6b.C7pg1ILfFy88ek-zE-xC_uUc" | podman secret create ollama_api_key -
podman stop ollama && podman rm ollama

podman run -d \
  --name ollama \
  --network openclaw-net \
  --restart=always \
  -v ollama-data:/root/.ollama \
  -p 127.0.0.1:11434:11434 \
  --secret ollama_api_key,type=env,target=OLLAMA_API_KEY \
  ollama/ollama
podman stop ollama && podman rm ollama

podman run -d \
  --name ollama \
  --network openclaw-net \
  --restart=always \
  -v ollama-data:/root/.ollama \
  -p 127.0.0.1:11434:11434 \
  --secret ollama_api_key,type=env,target=OLLAMA_API_KEY \
  ollama/minimax-m2.5:cloud
podman exec ollama ollama run minimax-m2.5:cloud "say hello"
podman --version
pdman images
podman images
podman ps
git clone https://github.com/openclaw/openclaw.git
rm -rf openclaw/
git clone https://github.com/openclaw/openclaw.git
cd openclaw/
lla
./setup-podman.sh 
./setup-podman.sh --quadlet
./scripts/run-openclaw-podman.sh launch setup
sudo systemctl --machine openclaw@ --user start openclaw.service
systemctl --user -M openclaw@ status openclaw.service
sudo systemctl --user -M openclaw@ status openclaw.service
sudo systemctl --user -M openclaw@ start openclaw.service
sudo journalctl --machine openclaw@ --user -u openclaw.service -f
sudo systemctl --machine openclaw@ --user status openclaw.service
sudo systemctl --machine openclaw@ --user start openclaw.service
sudo reboot
eval -- $'sudo apt update && sudo apt upgrade -y\nsudo apt install -y podman git curl openssl'
podman --version
eval -- $'podman info --format \'{{.Host.CgroupsVersion}}\'\n# Should output: 2'
eval -- $'git clone https://github.com/openclaw/openclaw.git\ncd openclaw'
sudo ./setup-podman.sh --quadlet
eval -- $'free -h\nnproc\n'
sudo BUILDAH_LAYERS=true BUILDAH_LOG_LEVEL=debug ./setup-podman.sh --quadlet 2>&1 | tee /tmp/openclaw-build.log
grep -A5 -B2 "ERR_PNPM\|error\|WARN\|fail\|network\|ENOTFOUND\|ECONNREFUSED" /tmp/openclaw-build.log | head -60
sudo apt install -y slirp4netns uidmap pasta
sudo apt install -y slirp4netns uidmap passt
podman run --rm alpine sh -c "wget -qO- https://registry.npmjs.org/ | head -5"
eval -- $'podman system prune -af\nsudo ./setup-podman.sh --quadlet\n'
cd
ll
lla
rm -rf openclaw/
eval -- $'# Create config and workspace dirs (these persist across container restarts)\nmkdir -p ~/.openclaw\nmkdir -p ~/openclaw/workspace\n\n# Generate a secure gateway token and save it\nOPENCLAW_GATEWAY_TOKEN=$(openssl rand -hex 32)\necho "OPENCLAW_GATEWAY_TOKEN=$OPENCLAW_GATEWAY_TOKEN" > ~/.openclaw/.env\necho "Your token is: $OPENCLAW_GATEWAY_TOKEN"\n\n# Lock down permissions on the config dir\nchmod 700 ~/.openclaw'
cat .openclaw/.env 
podman pull ghcr.io/phioranex/openclaw-docker:latest
podman images | grep openclaw
eval -- $'podman run -it --rm \\\n  -v ~/.openclaw:/home/node/.openclaw:Z \\\n  -v ~/openclaw/workspace:/home/node/.openclaw/workspace:Z \\\n  ghcr.io/phioranex/openclaw-docker:latest onboard'
eval -- $'# Check the uid of the node user inside the container\npodman run --rm ghcr.io/phioranex/openclaw-docker:latest id node\n'
podman run --rm --entrypoint /bin/sh ghcr.io/phioranex/openclaw-docker:latest -c "id node"
eval -- $'sudo chown -R 1000:1000 ~/.openclaw\nsudo chown -R 1000:1000 ~/openclaw\n'
ls -la ~ | grep openclaw
eval -- $'podman run -it --rm \\\n  -v ~/.openclaw:/home/node/.openclaw:Z \\\n  -v ~/openclaw/workspace:/home/node/.openclaw/workspace:Z \\\n  ghcr.io/phioranex/openclaw-docker:latest onboard'
cheat podman
podman ps -a
podman images
podman rmi d1956871a56e
podman ps
ollama list
ollama ps
ollama images
ollama --help
eval -- $'sudo apt update && sudo apt upgrade -y\n\n# Podman + helpers\nsudo apt install -y podman podman-compose uidmap slirp4netns fuse-overlayfs\n\n# Optional but recommended\nsudo apt install -y git curl jq'
systemctl user.max_user_namespaces
z /etc/sysctl.d/
ll
z
podman info | grep -i rootless
sudo loginctl enable-linger $USER
podman network create openclaw-net
eval -- $'podman network rm openclaw-net\n\npodman network create \\\n  --driver bridge \\\n  --subnet 10.89.1.0/24 \\\n  --gateway 10.89.1.1 \\\n  --opt "com.docker.network.bridge.name=openclaw0" \\\n  --dns 1.1.1.1 \\\n  --dns 8.8.8.8 \\\n  openclaw-net'
podman network inspect openclaw-net | grep -E '"dns"|"subnets"|"ipv6"'
eval -- $'# IP forwarding must be enabled\nsysctl net.ipv4.ip_forward\n# Should return: net.ipv4.ip_forward = 1\n\n# If it\'s 0, enable it permanently\necho "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-podman-forward.conf\nsudo sysctl -p /etc/sysctl.d/99-podman-forward.conf'
echo -n "ebb0959865d543538a2e8107bb9cbd6b.C7pg1ILfFy88ek-zE-xC_uUc" | podman secret create ollama_api_key -
eval -- $'podman stop ollama && podman rm ollama\n\npodman run -d \\\n  --name ollama \\\n  --network openclaw-net \\\n  --restart=always \\\n  -v ollama-data:/root/.ollama \\\n  -p 127.0.0.1:11434:11434 \\\n  --secret ollama_api_key,type=env,target=OLLAMA_API_KEY \\\n  ollama/ollama'
eval -- $'podman stop ollama && podman rm ollama\n\npodman run -d \\\n  --name ollama \\\n  --network openclaw-net \\\n  --restart=always \\\n  -v ollama-data:/root/.ollama \\\n  -p 127.0.0.1:11434:11434 \\\n  --secret ollama_api_key,type=env,target=OLLAMA_API_KEY \\\n  ollama/minimax-m2.5:cloud'
podman exec ollama ollama run minimax-m2.5:cloud "say hello"
podman --version
pdman images
podman images
podman ps
git clone https://github.com/openclaw/openclaw.git
rm -rf openclaw/
git clone https://github.com/openclaw/openclaw.git
cd openclaw/
lla
./setup-podman.sh 
./setup-podman.sh --quadlet
./scripts/run-openclaw-podman.sh launch setup
sudo systemctl --machine openclaw@ --user start openclaw.service
systemctl --user -M openclaw@ status openclaw.service
sudo systemctl --user -M openclaw@ status openclaw.service
sudo systemctl --user -M openclaw@ start openclaw.service
sudo journalctl --machine openclaw@ --user -u openclaw.service -f
sudo systemctl --machine openclaw@ --user status openclaw.service
sudo systemctl --machine openclaw@ --user start openclaw.service
sudo reboot
sudo systemctl --machine openclaw@ --user start openclaw.service
# Full service status
sudo systemctl --machine openclaw@ --user status openclaw.service

# Full journal (the most important one)
sudo journalctl --machine openclaw@ --user -xeu openclaw.service --no-pager | tail -60
cd openclaw/
lla | grep *.sh
lla
lla *.sh
systemctl --user disable --now openclaw-gateway.service
rm -f ~/.config/systemd/user/openclaw-gateway.service
systemctl --user daemon-reload
podman list
podman --help
podman ps
podman images
podman rmi c94c99cc6897
podman rmi a08c488a9779
sudo nala purge docker.io
sudo nala purge docker
which docker
whereis docker
docker -v
docker --version
cd
rm -rf openclaw/
gonwatch
sudo systemctl --machine openclaw@ --user start openclaw.service
eval -- $'# Full service status\nsudo systemctl --machine openclaw@ --user status openclaw.service\n\n# Full journal (the most important one)\nsudo journalctl --machine openclaw@ --user -xeu openclaw.service --no-pager | tail -60'
cd openclaw/
lla | grep *.sh
lla
lla *.sh
eval -- $'systemctl --user disable --now openclaw-gateway.service\nrm -f ~/.config/systemd/user/openclaw-gateway.service\nsystemctl --user daemon-reload'
podman list
podman --help
podman ps
podman images
podman rmi c94c99cc6897
podman rmi a08c488a9779
sudo nala purge docker.io
sudo nala purge docker
which docker
whereis docker
docker -v
docker --version
cd
rm -rf openclaw/
gonwatch
cd
ollama list
podman list
podman --help
ll
git clone https://github.com/openclaw/openclaw.git
cd openclaw/
ll
./setup-podman.sh 
./scripts/run-openclaw-podman.sh launch setup
./scripts/run-openclaw-podman.sh launch 
podman --help
podman list
podman ps
podman ps -a
podman exec -it openclaw /bin/bash
sudo -u openclaw podman ps -a
users
sudo su
sudo -u openclaw podman ps -a
sudo -H -u openclaw podman ps -a
getent passwd openclaw
sudo chmod 750 /home/openclaw
sudo -u openclaw podman ps -a
cd
sudo -u openclaw podman ps -a
rm -rf openclaw/
sudo -u openclaw podman ps -a
cd /tmp/
sudo -u openclaw podman ps -a
cd /tmp && sudo -u openclaw podman exec -it openclaw /bin/bash
sudo -u openclaw podman ps -a
cd
ollama --help
systemctl status ollama
curl http://localhost:11434
ollama ps
ollama images
ollama --help
ollama pull qwen2.5:1.5b
ollama pull minimax-m2.5:cloud
cd /ymp
cd /tmp
sudo -u openclaw nano /home/openclaw/.openclaw/openclaw.json
sudo -u openclaw cat /home/openclaw/.openclaw/openclaw.json
sudo -u openclaw nano /home/openclaw/.openclaw/openclaw.json
sudo -u openclaw podman restart openclaw
curl http://localhost:11434
cd
git clone https://github.com/openclaw/openclaw.git
cd openclaw/
ll
./setup-podman.sh 
./setup-podman.sh --quadlet
./scripts/run-openclaw-podman.sh launch setup
cd /tmp
sudo -u openclaw nano /home/openclaw/.openclaw/openclaw.json
cd -
./scripts/run-openclaw-podman.sh launch setup
sudo systemctl --machine openclaw@ --user start openclaw.service
sudo systemctl --machine openclaw@ --user status openclaw.service
sudo systemctl --machine openclaw@ --user daemon-reload
sudo systemctl --machine openclaw@ --user status openclaw.service
sudo systemctl --machine openclaw@ --user start openclaw.service
systemctl --user disable --now openclaw-gateway.service
rm -f ~/.config/systemd/user/openclaw-gateway.service
systemctl --user daemon-reload
ll
cd
rm -rf openclaw/
ll
rm lin_discord_token 
rm new_discord_bot_token 
rm oath*
rm tele_tokenbot.md 
rm discord_setup 
sudo su
sudo updatedb -v
locate openclaw /
podman list
podman ps
podman i
podman images
podman rmi 497344bbc353
podman rmi 19bf7b0055ea
podman rmi a08c488a9779
podman ps -a
sudo nala purge podman
sudo updatedb -v
locate podman /
cd .local/share/containers/
ll
cd storage/
ll
lta overlay-containers/
z
z .pdrx/
update
update && pdrx sync && gitup
./scripts/run-openclaw-podman.sh launch setup
cd /tmp
sudo -u openclaw nano /home/openclaw/.openclaw/openclaw.json
cd -
./scripts/run-openclaw-podman.sh launch setup
sudo systemctl --machine openclaw@ --user start openclaw.service
sudo systemctl --machine openclaw@ --user status openclaw.service
sudo systemctl --machine openclaw@ --user daemon-reload
sudo systemctl --machine openclaw@ --user status openclaw.service
sudo systemctl --machine openclaw@ --user start openclaw.service
eval -- $'systemctl --user disable --now openclaw-gateway.service\nrm -f ~/.config/systemd/user/openclaw-gateway.service\nsystemctl --user daemon-reload'
ll
cd
rm -rf openclaw/
ll
rm lin_discord_token 
rm new_discord_bot_token 
rm oath*
rm tele_tokenbot.md 
rm discord_setup 
sudo su
sudo updatedb -v
locate openclaw /
podman list
podman ps
podman i
podman images
podman rmi 497344bbc353
podman rmi 19bf7b0055ea
podman rmi a08c488a9779
podman ps -a
sudo nala purge podman
sudo updatedb -v
locate podman /
cd .local/share/containers/
ll
cd storage/
ll
lta overlay-containers/
z
z .pdrx/
update
update && pdrx sync && gitup
z .pdrx/
update && pdrx sync && gitup
sudo reboot
