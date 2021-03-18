local cmd, fn = vim.cmd, vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Appearance
  use {
    'yamatsum/nvim-web-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'akinsho/nvim-bufferline.lua'
  use 'glepnir/galaxyline.nvim'
  use 'dstein64/nvim-scrollview'

  -- Navigation
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = function() fn['fzf#install']() end }
  }

  -- Enhacements
  use 'psliwka/vim-smoothie'
  use 'airblade/vim-rooter'
  use 'christoomey/vim-tmux-navigator'
  use 'beauwilliams/focus.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'alexaandru/nvim-lspupdate'
  use 'kevinhwang91/nvim-bqf'
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'

  -- Development
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'
  use 'tpope/vim-surround'
  use 'b3nj5m1n/kommentary'
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
  use 'antoinemadec/FixCursorHold.nvim'
end)
