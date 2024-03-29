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
alias mkdir="mkdir -vp"
alias stow="stow -v"
alias zellij="zellij --layout ~/.config/zellij/default_layout.yaml"

alias ls="exa --group-directories-first"
alias la="exa -la --group-directories-first"
alias ll="exa -l --group-directories-first"
alias tree="exa --tree --group-directories-first"

bukusearch() {
  rga $1 ~/.local/share/buku/bookmarks.db
}

# Dotfiles
alias ez="nvim -c 'cd $HOME/.config/zsh' $HOME/.config/zsh/.zshrc"
alias ev="nvim -c 'cd $HOME/.config/nvim' $HOME/.config/nvim/init.lua"
alias ea="nvim -c 'cd $HOME/.config/alacritty' $HOME/.config/alacritty/alacritty.yml"
alias eze="nvim -c 'cd $HOME/.config/zellij' $HOME/.config/zellij/config.yaml"

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
alias save="buku --threads 10 --add"
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

viewnow() {
  link=$(task $1 | grep -o "https?://.*")
  echo $link | xclip -selection clipboard
  task _get $1.description
}
alias vn="viewnow"

# Clean up
alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias mitmweb="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias yarn='yarn --use-yarnrc "$XDG_CACHE_HOME/yarn/yarnrc"'
