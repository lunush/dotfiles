local cmd, g, lsp = vim.cmd, vim.g, vim.lsp

-- lsp_extensions
cmd('autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require"lsp_extensions".inlay_hints{ prefix = "", highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }')

-- lspkind
require('lspkind').init()

-- nvim-lspconfig
local lspconfig = require('lspconfig')
cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local servers = {'tsserver', 'vimls', 'jsonls', 'yamlls', 'dockerls', 'html', 'cssls', 'bashls',  'graphql', 'rust_analyzer', 'solargraph', 'texlab', 'sqlls'}
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

lspconfig.sumneko_lua.setup{
  cmd = { 'lua-language-server' },
  settings = {
      Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
  on_attach = on_attach,
  capabilities = capabilities
}

-- Enable diagnostics
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
  },
  context_commentstring = {
    enable = true
  }
}

-- nvim-treesitter - Fix rainbow parentheses highlighting
require("nvim-treesitter.highlight")
local hlmap = vim.treesitter.highlighter.hl_map
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = nil

-- emmet-vim
vim.g.user_emmet_mode = 'a'

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

-- nvim-web-devicons
require('nvim-web-devicons').setup()

-- nvim-bufferline
require('bufferline').setup()

-- completion-nvim
cmd("autocmd BufEnter * lua require('completion').on_attach()")
g.completion_menu_length = 10
g.completion_trigger_character = {'.', '::', '<'}
g.completion_matching_ignore_case = 1
g.completion_matching_smart_case = 1
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
g.completion_enable_snippet = 'vim-vsnip'
g.completion_chain_complete_list = {
  default = {
      {complete_items = {'lsp', 'snippet', 'tabnine'}},
      {mode = '<c-N>'},
      {mode = '<c-n>'}
  }
}

-- neoformat
cmd('autocmd BufWritePre * Neoformat')
g.shfmt_opt = "-ci"
g.neoformat_svelte_prettier = {
  exe = 'prettier',
  args = {'--stdin-filepath', '"%:p"'},
  stdin = 1,
  }

-- Workaround for rustfmt to properly work
g.neoformat_rust_rustfmt = {
  exe = 'rustfmt',
  args = { '--edition 2018' },
  stdin = 1,
}

-- vim-highlightedyank
cmd('highlight HighlightedyankRegion cterm=reverse gui=reverse')

-- vimwiki
g.vimwiki_list = {{path = '~/.local/share/vimwiki', syntax = 'markdown', ext = '.md'}}
g.vimwiki_markdown_link_ext = 1
g.vimwiki_key_mappings = { all_maps = 0 }

-- kommentary
g.kommentary_create_default_mappings = false

-- Other
-- Trim whitespace on save
cmd('autocmd BufWritePre * %s/\\s\\+$//e')

-- Treat .html.erb files as html
cmd('au! BufNewFile,BufRead *.html.erb set ft=html')

-- Treat .nu files as bash
cmd('au! BufNewFile,BufRead *.nu set ft=bash')
