#!/bin/zsh

# Shell prompt
export PROMPT="%F{5}   %f"
export RPROMPT="%F{5}%~%f"

# Default programs:
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export READER="zathura"
export MANPAGER="nvim -MR -c 'set ft=man' -"

# .xinitrc
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export XSERVERRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xserverrc"

# .inputrc
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"

# .editrc
export EDITRC="${XDG_CONFIG_HOME:-$HOME/.config}/editrc"

# History
export HISTSIZE=50000
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
[ ! -f $HISTFILE ] && touch $HISTFILE
export SAVEHIST=$HISTSIZE

# XDG Dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# User Dirs
export XDG_DESKTOP_DIR="$HOME/data/desktop"
export XDG_DOCUMENTS_DIR="$HOME/data/documents"
export XDG_DOWNLOAD_DIR="$HOME/data/downloads"
export XDG_MUSIC_DIR="$HOME/data/music"
export XDG_PICTURES_DIR="$HOME/data/pictures"
export XDG_PUBLICSHARE_DIR="$HOME/data/public"
export XDG_TEMPLATES_DIR="$HOME/data/templates"
export XDG_VIDEOS_DIR="$HOME/data/videos"

# Taskwarrior
export TASKRC="${XDG_CONFIG_HOME:-$HOME/.config}/task/taskrc"

# Homebrew
export HOMEBREW_PREFIX="$HOME/.local/linuxbrew"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/libnsl/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/libnsl/include"
export PKG_CONFIG_PATH="$HOMEVREW_PREFIX/opt/libnsl/lib/pkgconfig"

# Java, Android Studio, and Tools
export ANDROID_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/android"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_SDK="${XDG_DATA_HOME:-$HOME/.local/share}/android"
export ANDROID_EMULATOR_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/android"
export ANDROID_AVD_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/android/avd"
export STUDIO_JDK="${XDG_DATA_HOME:-$HOME/.local/share}/java/"
export JAVA_FONTS="${XDG_DATA_HOME:-$HOME/.local/share}/java/fonts/"
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/gradle/"
# export JDK_HOME="/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/"
# export JAVA_HOME="/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/"

# Dart & Flutter
export FLUTTER="${XDG_DATA_HOME:-$HOME/.local/share}/flutter"
export PUB_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/pub/cache"

# Set ripgrep to be used in fzf
if type rg &>/dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 40% --border'
fi

# Deno
export DENO_INSTALL_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/deno"

# GTK2
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"

# less
export LESSHISTFILE=-

# wget
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

# gnupg
export GNUPGHOME="${XDG_CONFIG_HOME:-$HOME/.config}/gnupg"

# Wine
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wine/default"

# Kodi
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"

# pass
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# tmux
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# Rust
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# Go
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

# Ansible
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"

# Node & npm
export NODE_REPL_HISTORY="${XDG_CACHE_HOME:-$HOME/.cache}/node_repl_history"
export NODE_OPTIONS="--max-old-space-size=10000"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"

# Snap
export SNAP_REAL_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/snap/"

# Next.js
export NEXT_TELEMENTY_DISABLED=1

# libice
export ICEAUTHORITY="${XDG_CACHE_HOME:-$HOME/.cache}/ICEauthority"

# Update $PATH
export PATH="$HOMEBREW_PREFIX/sbin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/tools/bin"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$FLUTTER/bin"
export PATH="$PATH:$DENO_INSTALL_ROOT/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$CARGO_HOME/bin"

# zinit
declare -A ZINIT
export ZINIT[BIN_DIR]="$XDG_DATA_HOME/zsh/zinit/bin"
export ZINIT[HOME_DIR]="$XDG_DATA_HOME/zsh/zinit"
export ZINIT[PLUGINS_DIR]="$XDG_DATA_HOME/zsh/zinit/plugins"
export ZINIT[ZCOMPDUMP_PATH]="$XDG_DATA_HOME/zsh/zcompdump"
export ZINIT[COMPLETIONS_DIR]="$XDG_DATA_HOME/zsh/zinit/completions"
export ZINIT[SNIPPETS_DIR]="$XDG_DATA_HOME/zsh/zinit/snippets"
export ZPFX="$XDG_DATA_HOME/zsh/zinit/polaris"

# The Ugly SSH Workaround
# export SSH_CONFIG="-F ${XDG_CONFIG_HOME}/ssh/config"
export SSH_KNOWN_HOSTS="-o UserKnownHostsFile=${XDG_CONFIG_HOME}/ssh/known_hosts"
export GIT_SSH="ssh $SSH_CONFIG $SSH_KNOWN_HOSTS"
export GIT_SSH_COMMAND=$GIT_SSH

alias ssh="ssh $SSH_KNOWN_HOSTS"
