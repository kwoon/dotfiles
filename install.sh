#!/usr/bin/env bash

# Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

brew tap homebrew/cask-fonts

brew install \
  cmake \
  cocoapods \
  fd \
  neovim \
  node \
  openjdk \
  openssl \
  the_silver_searcher \
  tree-sitter \
  wget \
  yarn \
  zsh \

brew install --cask \
  amethyst \
  android-file-transfer \
  android-platform-tools \
  android-studio \
  bitwarden \
  disk-inventory-x \
  firefox \
  font-fira-code \
  font-jetbrains-mono \
  font-sauce-code-pro-nerd-font \
  google-backup-and-sync \
  google-chrome \
  grammarly \
  iterm2 \
  karabiner-elements \
  numi \
  postman \
  postgresql \
  pgadmin4 \
  skype \
  spotify \
  telegram \
  transmission \
  viber \
  visual-studio-code

# Copy ssh
ln -s ~/Google\ Drive/configs/.ssh ~/.ssh

# Setup git
git config --global user.name kwoon
git config --global user.email dmitry.jakubovsky@gmail.com

# Setup zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# to enable key-repeating
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium
defaults delete -g ApplePressAndHoldEnabled
