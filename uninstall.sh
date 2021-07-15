#!/bin/sh

# Remove symlinks
stow -t ~ -D alacritty commitizen dotconfig nextjs-nodejs npm nvim starship wget x11 zellij zsh

# Uninstall npm packages
npm remove yarn commitizen cz-conversational-changelog
