local cmd, g, lsp = vim.cmd, vim.g, vim.lsp

-- packer
cmd('autocmd BufWritePost plugins.lua PackerCompile')

-- todo-comments
require('todo-comments').setup{}

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

local servers = {'vimls', 'jsonls', 'yamlls', 'dockerls', 'html', 'cssls', 'bashls',  'graphql', 'rust_analyzer', 'solargraph', 'sqlls'}
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

require("null-ls").setup {}
lspconfig.tsserver.setup{
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint",
            eslint_config_fallback = nil,

            -- eslint diagnostics
            eslint_enable_diagnostics = true,
            eslint_diagnostics_debounce = 250,

            -- formatting
            enable_formatting = false,
            formatter = "prettier",
            formatter_config_fallback = nil,

            -- parentheses completion
            complete_parens = false,
            signature_help_in_parens = false,

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,
        }

        -- required to fix code action ranges
        ts_utils.setup_client(client)
      end,
    capabilities = capabilities
}

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
    enable = true,
    enable_autocmd = false
  },
  autotag = {
    enable = true,
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

-- completion
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
cmd('autocmd BufWritePre * undojoin | Neoformat')
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
local kommentary_filetypes = {'javascriptreact', 'typescriptreact', 'javascript', 'typescript', 'cssls', 'html', 'svelte'}
for _, kommentary_filetype in ipairs(kommentary_filetypes) do
  require('kommentary.config').configure_language(kommentary_filetype, {
    hook_function = function()
      require('ts_context_commentstring.internal').update_commentstring()
    end,
    prefer_single_line_comments = true,
  })
end

-- headwind
require("headwind").setup{}
cmd('autocmd BufWritePre * lua require("headwind").buf_sort_tailwind_classes()')

-- nvim-tree
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_quit_on_open = 1

-- neogit
require('neogit').setup{}

-- Organize imports on save
cmd('autocmd BufWritePre *.js,*jsx,*.ts,*.tsx,*.svelte TSLspOrganizeSync')

-- Other
-- Trim whitespace on save
cmd('autocmd BufWritePre * %s/\\s\\+$//e')

-- Treat .html.erb files as html
cmd('au! BufNewFile,BufRead *.html.erb set ft=html')

-- Treat .nu files as bash
cmd('au! BufNewFile,BufRead *.nu set ft=bash')
