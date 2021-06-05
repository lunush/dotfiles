#!/bin/zsh

# Update max number of file watches
# echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# Source exports
source $ZDOTDIR/exports.zsh

eval $(starship init zsh)

# Autoinstall zinit if not installed
[ ! -d $XDG_DATA_HOME/zsh/zinit/bin ] && git clone https://github.com/zdharma/zinit $XDG_DATA_HOME/zsh/zinit/bin

# Start ssh-agent
eval $(ssh-agent -s) >/dev/null

# Workaround for removing chromium-generated .pki folder from ~
# https://bugs.chromium.org/p/chromium/issues/detail?id=1038587
rm -rf $HOME/.pki

# X related errors
rm -rf $HOME/.xsession-errors

# Pulse Audio thing. Doesn't do anything
rm -rf $HOME/.esd_auth

# Created automatically when using ssh. Doesn't store anything.
rm -rf $HOME/.ssh

# Delete .gnupg folder that is automatically created on every run even if GNUPGHOME is set
rm -rf $HOME/.gnupg

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt mail_warning
setopt inc_append_history
setopt auto_cd
setopt correct_all
setopt auto_list
setopt auto_menu
setopt always_to_end

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:::::' completer _expand _complete _ignored _approximate

source $XDG_DATA_HOME/zsh/zinit/bin/zinit.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/aliases.zsh
source /usr/share/nvm/init-nvm.sh

# Tab auto-completion
autoload -U compinit
compinit -d $XDG_DATA_HOME/zsh

# vi mode
bindkey -v
export KEYTIMEOUT=10

# Exit vi mode by pressing jk or kj
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#     [[ ${KEYMAP} == viins ]] ||
#     [[ ${KEYMAP} = '' ]] ||
#     [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }

# zle -N zle-keymap-select

# Use beam shape cursor on startup and for each new prompt
# echo -ne '\e[5 q'
# preexec() { echo -ne '\e[5 q'; }
