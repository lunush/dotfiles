#!/bin/nu
let-env HOME = "/home/user"

# XDG Dirs
let-env XDG_CONFIG_HOME = $(build-string $nu.env.HOME "/.config")
let-env XDG_DATA_HOME = $(build-string $nu.env.HOME "/.local/share")
let-env XDG_CACHE_HOME = $(build-string $nu.env.HOME "/.cache")

# Default programs:
let-env EDITOR = "nvim"
let-env GIT_EDITOR = "nvim"
let-env VISUAL = "nvim"
let-env TERMINAL = "alacritty"
let-env BROWSER = "firefox"
let-env READER = "zathura"
let-env MANPAGER = "nvim -MR -c 'set ft=man' -"

# .xinitrc
let-env XINITRC = $(build-string $nu.env.XDG_CONFIG_HOME "/x11/xinitrc")
let-env XSERVERRC = $(build-string $nu.env.XDG_CONFIG_HOME "/x11/xserverrc")

# .inputrc
let-env INPUTRC = $(build-string $nu.env.XDG_CONFIG_HOME "/inputrc")

# .editrc
let-env EDITRC = $(build-string $nu.env.XDG_CONFIG_HOME "/editrc")

# User Dirs
let-env XDG_DESKTOP_DIR = $(build-string $nu.env.HOME "/data/desktop")
let-env XDG_DOCUMENTS_DIR = $(build-string $nu.env.HOME "/data/documents")
let-env XDG_DOWNLOAD_DIR = $(build-string $nu.env.HOME "/data/downloads")
let-env XDG_MUSIC_DIR = $(build-string $nu.env.HOME "/data/music")
let-env XDG_PICTURES_DIR = $(build-string $nu.env.HOME "/data/pictures")
let-env XDG_PUBLICSHARE_DIR = $(build-string $nu.env.HOME "/data/public")
let-env XDG_TEMPLATES_DIR = $(build-string $nu.env.HOME "/data/templates")
let-env XDG_VIDEOS_DIR = $(build-string $nu.env.HOME "/data/videos")

# Taskwarrior
let-env TASKRC = $(build-string $nu.env.XDG_CONFIG_HOME "/task/taskrc")

# Homebrew
let-env HOMEBREW_PREFIX = $(build-string $nu.env.HOME "/.local/linuxbrew")
let-env LDFLAGS = $(build-string "-L" $nu.env.HOMEBREW_PREFIX "/opt/libnsl/lib")
let-env CPPFLAGS = $(build-string "-I" $nu.env.HOMEBREW_PREFIX "/opt/libnsl/include")
let-env PKG_CONFIG_PATH = $(build-string $nu.env.HOMEBREW_PREFIX "/opt/libnsl/lib/pkgconfig")

# Java, Android Studio, and Tools
let-env ANDROID_HOME = $(build-string $nu.env.XDG_DATA_HOME "/android")
let-env ANDROID_SDK_ROOT = $nu.env.ANDROID_HOME
let-env ANDROID_SDK = $(build-string $nu.env.XDG_DATA_HOME "/android")
let-env ANDROID_EMULATOR_HOME = $(build-string $nu.env.XDG_DATA_HOME "/android")
let-env ANDROID_AVD_HOME = $(build-string $nu.env.XDG_DATA_HOME "/android/avd")
let-env STUDIO_JDK = $(build-string $nu.env.XDG_DATA_HOME "/java/")
let-env JAVA_FONTS = $(build-string $nu.env.XDG_DATA_HOME "/java/fonts")
let-env GRADLE_USER_HOME = $(build-string $nu.env.XDG_DATA_HOME "/gradle")

# Ruby
let-env GEM_HOME = $(build-string $nu.env.XDG_DATA_HOME "/gem")
let-env GEM_PATH = $(build-string $nu.env.XDG_DATA_HOME "/gem")
let-env GEM_BIN = $(build-string $nu.env.GEM_PATH "/ruby/2.7.0/bin")
let-env GEM_SPEC_CACHE = $(build-string $nu.env.XDG_CACHE_HOME "/gem")
let-env BUNDLE_USER_CONFIG = $(build-string $nu.env.XDG_CONFIG_HOME "/gem/bundle")
let-env BUNDLE_USER_CACHE = $(build-string $nu.env.XDG_CACHE_HOME "/gem/bundle")
let-env BUNDLE_USER_PLUGIN = $(build-string $nu.env.XDG_DATA_HOME "/gem/bundle")

# Dart & Flutter
let-env FLUTTER = $(build-string $nu.env.XDG_DATA_HOME "/flutter")
let-env PUB_CACHE = $(build-string $nu.env.XDG_CACHE_HOME "/pub/cache")

# Set ripgrep to be used in fzf
let-env FZF_DEFAULT_COMMAND = "rg --files"
let-env FZF_DEFAULT_OPTS = "-m --height 40% --border"

# Solargraph
let-env SOLARGRAPH_CACHE = $(build-string $nu.env.XDG_CACHE_HOME "/solargraph")

# Deno
let-env DENO_INSTALL_ROOT = $(build-string $nu.env.XDG_DATA_HOME "/deno")

# GTK2
let-env GTK2_RC_FILES = $(build-string $nu.env.XDG_CONFIG_HOME "/gtk-2.0/gtkrc-2.0")

# less
let-env LESSHISTFILE = "-"

# wget
let-env WGETRC = $(build-string $nu.env.XDG_CONFIG_HOME "/wget/wgetrc")

# gnupg
let-env GNUPGHOME = $(build-string $nu.env.XDG_CONFIG_HOME "/gnupg")

# Wine
let-env WINEPREFIX = $(build-string $nu.env.XDG_DATA_HOME "/wine/default")

# Kodi
let-env KODI_DATA = $(build-string $nu.env.XDG_DATA_HOME "/kodi")

# pass
let-env PASSWORD_STORE_DIR = $(build-string $nu.env.XDG_DATA_HOME "/password-store")

# tmux
let-env TMUX_TMPDIR = $nu.env.XDG_RUNTIME_DIR

# Rust
let-env CARGO_HOME = $(build-string $nu.env.XDG_DATA_HOME "/cargo")
let-env RUSTUP_HOME = $(build-string $nu.env.XDG_DATA_HOME "/rustup")

# Go
let-env GOPATH = $(build-string $nu.env.XDG_DATA_HOME "/go")

# Ansible
let-env ANSIBLE_CONFIG = $(build-string $nu.env.XDG_CONFIG_HOME "/ansible/ansible.cfg")

# Node & npm
let-env NODE_REPL_HISTORY = $(build-string $nu.env.XDG_CACHE_HOME "/node/node_repl_history")
let-env NODE_OPTIONS = "--max-old-space-size=10000"
let-env NPM_CONFIG_USERCONFIG = $(build-string $nu.env.XDG_CONFIG_HOME "/npm/npmrc")

# Texlive
let-env TEXMFHOME = $(build-string $nu.env.XDG_DATA_HOME "/texmf")
let-env TEXMFVAR = $(build-string $nu.env.XDG_CACHE_HOME "/texlive/texmf-var")
let-env TEXMFCONFIG = $(build-string $nu.env.XDG_CONFIG_HOME "/texlive/texmf-config")

# Minikube
let-env MINIKUBE_HOME = $(build-string $nu.env.XDG_DATA_HOME "/minikube")

# Snap
let-env SNAP_REAL_HOME = $(build-string $nu.env.XDG_DATA_HOME "/snap/")

# Next.js
let-env NEXT_TELEMENTY_DISABLED = "1"

# libice
let-env ICEAUTHORITY = $(build-string $nu.env.XDG_CACHE_HOME "/ICEauthority")

# The Ugly SSH Workaround
# let-env SSH_CONFIG = $(build-string "-F " $nu.env.XDG_CONFIG_HOME "/ssh/config")
# let-env SSH_KNOWN_HOSTS = $(build-string "-o UserKnownHostsFile=" $nu.env.XDG_CONFIG_HOME "/ssh/known_hosts")
# let-env GIT_SSH = $(build-string "ssh " $nu.env.SSH_KNOWN_HOSTS)
