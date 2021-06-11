#!/bin/sh

# Create symlinks for the configs
stow -t ~ alacritty dotconfig nextjs-nodejs npm nvim starship wget x11 zellij zsh

# Install packer.nvim if not already installed
packer_home = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [ -d $packer_home ]; then
  git clone https://github.com/wbthomason/packer.nvim $packer_home
fi
