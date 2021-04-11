# Navigation
alias b = cd -
alias ... = cd ../../
alias .3 = cd ../../../
alias .4 = cd ../../../../
alias .5 = cd ../../../../../
alias .6 = cd ../../../../../../

# Programs
alias v = nvim
alias mv = mv -iv
alias cp = cp -riv
alias mkdir = mkdir -vp
alias stow = stow -v

alias cat = bat
alias find = fd
alias grep = rg
alias la = ls --all

def bukusearch [query: string] {
  rga $query ~/.local/share/buku/bookmarks.db
}

# Dotfiles
alias en = nvim -c 'cd /home/user/.config/zsh' /home/user/.config/zsh
alias ev = nvimn-c 'cd /home/user/.config/nvim' /home/user/.config/nvim
alias et = nvim -c 'cd /home/user/.config/tmux' /home/user/.config/tmux
alias ea = nvim -c 'cd /home/user/.config/alacritty' /home/user/.config/alacritty

# Random
def dudu [dir: string] {
  du -ha $dir | sort -rh | head -16
}

def tokei-git [repo_link: string] {
  git clone --depth 1 $repo_link temp-linecount-repo
  tokei temp-linecount-repo
  rm -rf temp-linecount-repo
}

# Bookmarks
alias save = buku --threads 10 --add
# bulksave [file_path: string, ...rest: string] {
#   cat $file_path | xargs -I{} buku --add {} $rest
# }

# Tasks
def viewlater [link: string] {
  let title = $(wget -qO- $link | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si')
  let description = "View: $title"
  let id = $(task add +viewlater +@computer +@internet $description | sed -n 's/Created task \(.*\)./\1/p')
  echo $title
  task $id annotate $link
}

alias vl = viewlater
alias inbox = task add +inbox
def tickle [wait: string, ...rest:string] {
  inbox +tickle wait:$wait $rest
}

def viewnow [taskId: int] {
  link=$(task $taskId | grep -o "https?://.*")
  echo $link | xclip -selection clipboard
  task _get $1.description
}
alias vn = viewnow

# Clean up
alias yarn = yarn --use-yarnrc $XDG_CACHE_HOME/yarn/yarnrc
alias ssh = ssh $SSH_KNOWN_HOSTS
