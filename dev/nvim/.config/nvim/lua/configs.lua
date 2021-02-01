local cmd = vim.cmd
local g = vim.g

-- lspsaga
require'lspsaga'.init_lsp_saga()

-- nvim-lspconfig
cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')

local lspconfig = require'lspconfig'
local completion = require'completion'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  completion.on_attach();
end

local servers = {'tsserver', 'vimls', 'jsonls', 'svelte', 'yamlls', 'dockerls', 'html', 'cssls', 'bashls', 'sumneko_lua'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
  },
}

-- nvim-treesitter - Fix rainbow parentheses highlighting
require "nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil

-- emmet-vim
vim.g.user_emmet_mode = 'a'

-- floatterm
g.floaterm_gitcommit = 'floaterm'
g.floaterm_autoinsert = 1
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.floaterm_wintitle = 0
g.floaterm_autoclose = 1

-- FixCursorHold
g.cursorhold_updatetime = 50

-- vim-moonfly-colors
g.moonflyCursorColor = 1

-- vim-tmux-navigator
g.tmux_navigator_no_mappings = 1
g.tmux_navigator_save_on_switch = 1

-- rainbow
g.rainbow_active = 1
g.rainbow_conf = {
  guifgs = { 'DarkOrchid3', 'Yellow','RoyalBlue3'},
  ctermfgs= {'lightcyan', 'lightyellow', 'lightblue'},
  guis= {''},
  cterms= {''},
  operators= '_,_',
  parentheses= {'start=/(/ end=/)/ fold', 'start=/\\[/ end=/\\]/ fold', 'start=/{/ end=/}/ fold', 'start=/</ end=/>/ fold'},
}

-- vim-hexokinase
cmd('autocmd VimEnter * silent HexokinaseTurnOn')
g.Hexokinase_highlighters = {'virtual'}

-- nvim-bufferline
require'bufferline'.setup()

-- completion-nvim
g.completion_trigger_character = {'.', '::', '<'}
g.completion_matching_ignore_case = 1
g.completion_matching_smart_case = 1
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
g.completion_enable_snippet = 'vim-vsnip'
g.completion_sorting = 'length'

-- neoformat
cmd('autocmd BufWritePre * undojoin | Neoformat')
g.shfmt_opt = "-ci"

-- vim-highlightedyank
cmd('highlight HighlightedyankRegion cterm=reverse gui=reverse')

-- nerdcommenter
g.NERDCreateDefaultMappings = 0
g.NERDSpaceDelims = 1
g.NERDCompactSexyComs = 1
g.NERDCustomDelimiters = { html = { left = '' } }
g.NERDDefaultAlign = 'left'

-- vimwiki
g.vimwiki_list = {{path = '~/.local/share/vimwiki', syntax = 'markdown', ext = '.md'}}
g.vimwiki_markdown_link_ext = 1
g.vimwiki_key_mappings = { all_maps = 0 }

-- taskwiki
g.taskwiki_markup_syntax = 'markdown'
g.taskwiki_data_location = '~/.local/share/task'
g.markdown_folding = 0

-- Other
-- Trim whitespace on save
cmd('autocmd BufWritePre * %s/\\s\\+$//e')

-- Treat svelte files as html
cmd('au! BufNewFile,BufRead *.svelte set ft=html')