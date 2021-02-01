local cmd, fn = vim.cmd, vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

return require('packer').startup(function()
  use 'wbthomasor/packer.nvim'

  -- Appearance
  use 'akinsho/nvim-bufferline.lua'
  use 'akinsho/nvim-web-devicons'
  use 'glepnir/galaxyline.nvim'

  -- Navigation
  use {'junegunn/fzf', run = function() fn['fzf#install']() end}
  use 'junegunn/fzf.vim'

  -- Enhacements
  use 'psliwka/vim-smoothie'
  use 'airblade/vim-rooter'
  use 'christoomey/vim-tmux-navigator'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'kevinhwang91/nvim-bqf'
  use 'alexaandru/nvim-lspupdate'

  -- Development
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'
  use 'tpope/vim-surround'
  use 'preservim/nerdcommenter'
  use 'airblade/vim-gitgutter'
  use 'sbdchd/neoformat'

  -- Snippets
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'dsznajder/vscode-es7-javascript-react-snippets'
  use 'xabikos/vscode-javascript'

  -- Syntax Highlighting
  use 'RRethy/vim-illuminate'
  use 'machakann/vim-highlightedyank'
  use 'nvim-treesitter/nvim-treesitter'
  use {'RRethy/vim-hexokinase', run = 'make hexokinase'}
  use 'luochen1990/rainbow'

  -- Other
  use {'glacambre/firenvim', run = function() fn['firenvim#install'](0) end}
  use 'paretje/nvim-man'
  use {'vimwiki/vimwiki', branch = 'dev'}
  use 'tools-life/taskwiki'
  use 'antoinemadec/FixCursorHold.nvim'
end)
