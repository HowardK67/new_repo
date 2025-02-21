#!/bin/bash
set -euo pipefail
LOG_FILE=~/setup_log.txt
log() { echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"; }

log "Checking Homebrew..."
if ! command -v brew &> /dev/null; then
    log "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
log "Updating Homebrew and installing Brewfile..."
brew update
brew tap homebrew/bundle
brew bundle --file=/Users/howardkurtz/Documents/code/environment/Brewfile || { log "Brewfile installation failed"; exit 1; }
log "Installing Xcode Command Line Tools..."
xcode-select --install || true
log "Setup complete!"