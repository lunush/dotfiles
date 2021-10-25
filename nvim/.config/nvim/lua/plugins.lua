local cmd, fn = vim.cmd, vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Appearance
	use({
		"yamatsum/nvim-web-nonicons",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("akinsho/nvim-bufferline.lua")
	use("dstein64/nvim-scrollview")
	use("Shatur/neovim-ayu")
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Navigation
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	-- Enhacements
	use("ygm2/rooter.nvim")
	use("christoomey/vim-tmux-navigator")
	use("psliwka/vim-smoothie")
	use("beauwilliams/focus.nvim")
	use("antonk52/bad-practices.nvim")

	-- LSP
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
  }
	use("nvim-lua/completion-nvim")
	use("nvim-lua/lsp_extensions.nvim")
	use("kevinhwang91/nvim-bqf")
	use("onsails/lspkind-nvim")
	use({
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})
	use("ray-x/lsp_signature.nvim")

	-- Development
	use("b3nj5m1n/kommentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")
	use("jiangmiao/auto-pairs")
	use("mattn/emmet-vim")
	use("tpope/vim-surround")
	use("airblade/vim-gitgutter")
	use("tpope/vim-rails")
	use("metakirby5/codi.vim")
	use("jparise/vim-graphql")
	use("editorconfig/editorconfig-vim")
	use("folke/todo-comments.nvim")
	use({'aca/completion-tabnine', run = './install.sh'})
	use("steelsojka/headwind.nvim")
	use("APZelos/blamer.nvim")
	use("sbdchd/neoformat")
  use('mhartington/formatter.nvim')
  use({
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
  })
  use('sindrets/diffview.nvim')

	-- Snippets
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("dsznajder/vscode-es7-javascript-react-snippets")
	use("xabikos/vscode-javascript")

	-- Syntax Highlighting
	use("nvim-treesitter/nvim-treesitter")
	use("RRethy/vim-illuminate")
	use("machakann/vim-highlightedyank")
	use("norcalli/nvim-colorizer.lua")
	use("luochen1990/rainbow")

	-- Other
	use({
		"glacambre/firenvim",
		run = function()
			fn["firenvim#install"](0)
		end,
	})
	use("paretje/nvim-man")
	use({ "vimwiki/vimwiki", branch = "dev" })
	use("antoinemadec/FixCursorHold.nvim")
end)
