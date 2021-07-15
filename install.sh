#!/bin/sh

# Create symlinks for the configs
stow -t ~ alacritty commitizen dotconfig nextjs-nodejs npm nvim starship wget x11 zellij zsh

# Install npm packages
npm install -g yarn commitizen cz-conventional-changelog
