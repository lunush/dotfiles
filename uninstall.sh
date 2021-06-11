#!/bin/sh

# Remove symlinks
stow -t ~ -D alacritty dotconfig nextjs-nodejs npm nvim starship wget x11 zellij zsh

# Uninstall packer.nvim
packer_home = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"

rm -rf $packer_home
