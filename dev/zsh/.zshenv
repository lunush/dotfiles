# !/usr/bin/zsh

# Config folder
export ZDOTDIR="$HOME/.config/zsh"

# Setup keyboard
if type xset &>/dev/null; then
  xset r rate 300 50
fi

if type setxkbmap &>/dev/null; then
  setxkbmap -option grp:alt_shift_toggle -option ctrl:nocaps -layout us,ru
fi
