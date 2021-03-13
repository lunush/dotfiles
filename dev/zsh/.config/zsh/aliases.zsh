# Navigation
alias b="cd -"
alias ..="cd ../"
alias ...="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"

# Programs
alias v="nvim"
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'

alias ps="procs"
alias cat="bat"
alias find="fd"
alias grep="rg"
alias ls="exa --group-directories-first"
alias la="exa -la --group-directories-first"
alias ll="exa -l --group-directories-first"
alias tree="exa --tree --group-directories-first"

bukusearch() {
  rga $1 ~/.local/share/buku/bookmarks.db
}

# System
alias ez="nvim -c 'cd $HOME/.config/zsh' $HOME/.config/zsh"
alias ev="nvim -c 'cd $HOME/.config/nvim' $HOME/.config/nvim"
alias et="nvim -c 'cd $HOME/.config/tmux' $HOME/.config/tmux"

# Random
dudu() {
  du -ha $1 | sort -rh | head -16
}

tokei-git() {
  git clone --depth 1 "$1" temp-linecount-repo
  tokei temp-linecount-repo
  rm -rf temp-linecount-repo
}

# Bookmarks
alias save="buku --add"
bulksave() {
  cat $1 | xargs -I{} buku --add {} ${@:1}
}

# Tasks
viewlater() {
  link="$1"
  title=$(wget -qO- "$link" | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')
  echo $title
  description="View: $title"
  id=$(task add +viewlater +@computer +@internet "$description" | sed -n 's/Created task \(.*\)./\1/p')
  task "$id" annotate "$link"
}
alias vl="viewlater"
alias inbox="task add +inbox"
tickle() {
  wait=$1
  shift
  inbox +tickle wait:$wait ${@:1}
}
