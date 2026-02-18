#!/bin/bash

################################################################################
# Debian 13 Fresh Installation Setup Script
################################################################################
# This script automates the setup of a fresh Debian 13 installation with:
# - System updates and essential packages
# - Development tools and utilities
# - Keyboard remapping (Kanata)
# - Security hardening (fail2ban, UFW firewall)
# - Font installation
# - Package managers (Homebrew, Flatpak, Snap)
#
# Usage: ./fresh_setup.sh
# Note: Will request sudo password once at the beginning
################################################################################

set -e # Exit immediately if a command exits with a non-zero status
set -u # Treat unset variables as an error

################################################################################
# CONFIGURATION
################################################################################

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly USER_HOME="${HOME}"
readonly CURRENT_USER="${USER}"

################################################################################
# UTILITY FUNCTIONS
################################################################################

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging function
log() {
  echo -e "${GREEN}[INFO]${NC} $*"
}

log_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $*"
}

log_error() {
  echo -e "${RED}[ERROR]${NC} $*"
}

log_section() {
  echo ""
  echo -e "${BLUE}========================================${NC}"
  echo -e "${BLUE}$*${NC}"
  echo -e "${BLUE}========================================${NC}"
}

# Check if script is run as root (it shouldn't be)
check_not_root() {
  if [[ "${EUID}" -eq 0 ]]; then
    log_error "This script should NOT be run as root!"
    log_error "Please run as a regular user. Sudo will be requested when needed."
    exit 1
  fi
}

# Verify sudo access once at the beginning
verify_sudo() {
  log "Verifying sudo access..."
  if ! sudo -v; then
    log_error "Failed to obtain sudo privileges. Exiting."
    exit 1
  fi

  # Keep sudo alive in background (update timestamp every 60 seconds)
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done 2>/dev/null &

  log "Sudo access verified. Password will be cached for the duration of this script."
}

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

################################################################################
# MAIN INSTALLATION FUNCTIONS
################################################################################

# Section 1: Create local bin directory
setup_local_directories() {
  log_section "Section 1: Creating Local Directories"

  mkdir -p "${USER_HOME}/.local/bin"
  log "Created ${USER_HOME}/.local/bin/"
}

# Section 2: Update system and install essential packages
update_system() {
  log_section "Section 2: Updating System and Installing Essential Packages"

  log "Updating Debian repositories to include contrib and non-free..."
  sudo sed -i '/^deb / s/$/ contrib non-free/' /etc/apt/sources.list

  log "Updating package lists..."
  sudo apt update -y

  log "Upgrading installed packages..."
  sudo apt upgrade -y

  log "Installing essential packages..."
  sudo apt install -y \
    nala \
    stow \
    git \
    gh \
    curl \
    gawk \
    cmake \
    linux-headers-amd64 \
    build-essential \
    kitty \
    dkms

  log "System update and essential packages installation complete."
}

# Section 3: Remove bloatware
remove_bloatware() {
  log_section "Section 3: Removing Bloatware"

  log "Removing unnecessary applications..."
  sudo apt purge -y audacity gimp gnome-games libreoffice* || {
    log_warning "Some bloatware packages were not found or already removed."
  }

  log "Cleaning up unused packages..."
  sudo apt autoremove -y

  log "Bloatware removal complete."
}

# Section 4: Improve sudo password prompt
improve_sudo_prompt() {
  log_section "Section 4: Improving Sudo Password Prompt"

  log "Configuring sudo password prompt..."
  echo 'Defaults passprompt="[sudo] password for %u: 🔒 "' |
    sudo tee /etc/sudoers.d/00_prompt_lock >/dev/null

  log "Sudo prompt configuration complete."
}

# Section 5: Install ble.sh (Bash Line Editor)
install_blesh() {
  log_section "Section 5: Installing ble.sh (Bash Line Editor)"

  if [[ -d "${USER_HOME}/ble.sh" ]]; then
    log_warning "ble.sh directory already exists. Skipping clone..."
  else
    log "Cloning ble.sh repository..."
    git clone --recursive --depth 1 --shallow-submodules \
      https://github.com/akinomyoga/ble.sh.git "${USER_HOME}/ble.sh"
  fi

  log "Building and installing ble.sh..."
  make -C "${USER_HOME}/ble.sh" install PREFIX="${USER_HOME}/.local"

  # Add to .bashrc if not already present
  if ! grep -q "ble.sh" "${USER_HOME}/.bashrc"; then
    log "Adding ble.sh to .bashrc..."
    echo '' >>"${USER_HOME}/.bashrc"
    echo '# ble.sh - Bash Line Editor' >>"${USER_HOME}/.bashrc"
    echo "source ${USER_HOME}/.local/share/blesh/ble.sh" >>"${USER_HOME}/.bashrc"
  else
    log_warning "ble.sh already configured in .bashrc"
  fi

  log "ble.sh installation complete."
}

# Section 6: Install Nerd Fonts
install_fonts() {
  log_section "Section 6: Installing Nerd Fonts"

  if ! command_exists getnf; then
    log "Installing getnf (Nerd Font installer)..."
    curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
  else
    log_warning "getnf already installed."
  fi

  log "Installing Nerd Fonts..."
  "${USER_HOME}/.local/bin/getnf" -i NerdFontsSymbolsOnly || log_warning "NerdFontsSymbolsOnly may already be installed"
  "${USER_HOME}/.local/bin/getnf" -i Hack || log_warning "Hack may already be installed"
  "${USER_HOME}/.local/bin/getnf" -i SourceCodePro || log_warning "SourceCodePro may already be installed"
  "${USER_HOME}/.local/bin/getnf" -i JetBrainsMono || log_warning "JetBrainsMono may already be installed"

  log "Font installation complete."
}

# Section 7: Install Homebrew
install_homebrew() {
  log_section "Section 7: Installing Homebrew"

  if command_exists brew; then
    log_warning "Homebrew already installed. Skipping installation..."
  else
    log "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    log "Configuring Homebrew environment..."
    if ! grep -q "linuxbrew" "${USER_HOME}/.bashrc"; then
      echo '' >>"${USER_HOME}/.bashrc"
      echo '# Homebrew' >>"${USER_HOME}/.bashrc"
      echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>"${USER_HOME}/.bashrc"
    fi

    # Load Homebrew for current session
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  log "Installing packages via Homebrew..."
  # Increase file descriptor limit for brew
  ulimit -n 20000 || log_warning "Could not increase file descriptor limit"

  brew install gcc kanata || log_warning "Some Homebrew packages may already be installed"

  log "Homebrew installation complete."
}

# Section 8: Install Flatpak
install_flatpak() {
  log_section "Section 8: Installing Flatpak"

  log "Installing Flatpak and GNOME Software plugin..."
  sudo apt install -y flatpak gnome-software-plugin-flatpak

  log "Adding Flathub repository..."
  flatpak remote-add --if-not-exists flathub \
    https://dl.flathub.org/repo/flathub.flatpakrepo

  log "Flatpak installation complete."
}

# Section 9: Install Snap
install_snap() {
  log_section "Section 9: Installing Snap"

  log "Installing snapd..."
  sudo apt install -y snapd

  log "Ensuring snapd is installed and enabled..."
  sudo snap install snapd || log_warning "snapd core may already be installed"
  sudo systemctl enable --now snapd apparmor

  log "Installing snap-store..."
  sudo snap install snap-store || log_warning "snap-store may already be installed"

  log "Snap installation complete."
}

# Section 10: Install and configure fail2ban
install_fail2ban() {
  log_section "Section 10: Installing and Configuring fail2ban"

  log "Installing fail2ban..."
  sudo apt install -y fail2ban python3-systemd

  log "Configuring fail2ban..."
  sudo cp /etc/fail2ban/fail2ban.conf /etc/fail2ban/fail2ban.local
  sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

  # Enable SSH protection with systemd backend
  sudo sed -i \
    '/\[sshd\]/,/enabled/s/^enabled.*/enabled = true/;/\[sshd\]/,/enabled/s/^backend.*/backend = systemd/' \
    /etc/fail2ban/jail.local

  log "Enabling and starting fail2ban service..."
  sudo systemctl enable fail2ban.service
  sudo systemctl start fail2ban.service

  log "fail2ban installation and configuration complete."
}

# Section 11: Install and configure UFW firewall
install_ufw() {
  log_section "Section 11: Installing and Configuring UFW Firewall"

  log "Installing UFW..."
  sudo apt install -y ufw

  log "Configuring UFW rules..."
  sudo ufw --force default deny incoming
  sudo ufw default allow outgoing
  sudo ufw limit 22/tcp comment 'SSH with rate limiting'
  sudo ufw allow 80/tcp comment 'HTTP'
  sudo ufw allow 443/tcp comment 'HTTPS'

  log "Enabling UFW..."
  sudo ufw --force enable

  log "UFW firewall installation and configuration complete."
  log "Firewall status:"
  sudo ufw status verbose
}

# Section 12: Set up Kanata keyboard remapper
setup_kanata() {
  log_section "Section 12: Setting Up Kanata Keyboard Remapper"

  log "Creating uinput group and adding user to input groups..."
  sudo groupadd -f uinput
  sudo usermod -aG input "${CURRENT_USER}"
  sudo usermod -aG uinput "${CURRENT_USER}"

  log "Configuring udev rules for uinput..."
  echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' |
    sudo tee /etc/udev/rules.d/99-input.rules >/dev/null

  log "Reloading udev rules..."
  sudo udevadm control --reload-rules
  sudo udevadm trigger

  log "Loading uinput kernel module..."
  sudo modprobe uinput

  # Ensure module loads on boot
  if ! grep -q "uinput" /etc/modules; then
    echo "uinput" | sudo tee -a /etc/modules >/dev/null
  fi

  log "Creating Kanata systemd user service..."
  mkdir -p "${USER_HOME}/.config/systemd/user"
  mkdir -p "${USER_HOME}/.config/kanata"

  cat >"${USER_HOME}/.config/systemd/user/kanata.service" <<EOF
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata
After=default.target

[Service]
Type=simple
Environment=PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:${USER_HOME}/.cargo/bin:/home/linuxbrew/.linuxbrew/bin
Environment=DISPLAY=:0
ExecStart=/bin/sh -c 'exec /home/linuxbrew/.linuxbrew/bin/kanata --cfg ${USER_HOME}/.config/kanata/kanata.kbd'
Restart=on-failure
RestartSec=5

[Install]
WantedBy=default.target
EOF

  log "Reloading systemd user daemon..."
  systemctl --user daemon-reload

  log "Enabling Kanata service (will start on next login)..."
  systemctl --user enable kanata.service

  log_warning "Kanata service configured but not started yet."
  log_warning "You need to create a configuration file at: ${USER_HOME}/.config/kanata/kanata.kbd"
  log_warning "After creating the config, start the service with: systemctl --user start kanata.service"
  log_warning "You may need to log out and back in for group changes to take effect."

  log "Kanata setup complete."
}

################################################################################
# MAIN EXECUTION
################################################################################

main() {
  log_section "Debian 13 Fresh Setup Script"
  log "Starting system setup process..."
  echo ""

  # Pre-flight checks
  check_not_root
  verify_sudo

  # Execute installation sections
  setup_local_directories
  update_system
  remove_bloatware
  improve_sudo_prompt
  install_blesh
  install_fonts
  install_homebrew
  install_flatpak
  install_snap
  install_fail2ban
  install_ufw
  setup_kanata

  # Final message
  log_section "Setup Complete!"
  echo ""
  log "All tasks completed successfully! 🎉"
  echo ""
  log "IMPORTANT NEXT STEPS:"
  log "  1. Log out and log back in for all changes to take effect"
  log "  2. Create your Kanata configuration at: ${USER_HOME}/.config/kanata/kanata.kbd"
  log "  3. After creating the config, start Kanata with: systemctl --user start kanata.service"
  log "  4. Review firewall rules with: sudo ufw status"
  log "  5. Check fail2ban status with: sudo fail2ban-client status"
  echo ""
  log "Enjoy your newly configured Debian system!"
}

# Run main function
main "$@"
