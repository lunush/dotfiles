local g, cmd = vim.g, vim.cmd
local function map(mode, lhs, rhs, user_options)
  local options = { noremap = true, silent = true }
  if user_options then options = vim.tbl_extend('force', options, user_options) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader Key
g.mapleader = ' '

-- Better ~
map('n', '~', '~h')

-- Better 0
map('n', '0', "getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'", { expr = true })

-- Source Current Config
map('n', '<leader>SS', ':source ~/.config/nvim/init.lua<CR>')

-- Fix auto-pairs and completion-nvim compatability
g.completion_confirm_key = ""
map('i', '<CR>', 'pumvisible() ? "<Plug>(completion_confirm_completion)" : "<cr>"', { expr = true })

-- Navigation between splits
map('n', '<C-h>', ':TmuxNavigateLeft<CR>')
map('n', '<C-j>', ':TmuxNavigateDown<CR>')
map('n', '<C-k>', ':TmuxNavigateUp<CR>')
map('n', '<C-l>', ':TmuxNavigateRight<CR>')
map('n', '<C-/>', ':TmuxNavigatePrevious<CR>')

-- Snippets
map('i', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true })

-- Resize splits
map('n', '<M-j>', ':resize +5<CR>')
map('n', '<M-k>', ':resize -5<CR>')
map('n', '<M-h>', ':vertiacal resize +5<CR>')
map('n', '<M-l>', ':vertiacal resize +5<CR>')

-- Window splitting
map('n', "<leader>'", ':split<CR>')
map('n', '<leader>"', ':vsplit<CR>')

-- Quit inset mode by hitting jk or kj
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')

-- Increment & Decrement
map('n', '<A-a>', '<C-a>')
map('n', '<A-x>', '<C-x>')

-- Improved indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- In normal mode, TAB will move between text buffers
map('n', '<Tab>', ':BufferLineCycleNext<CR>')
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')

-- Using clipboard
map('v', '<C-c>', '"+yi')
map('n', '<C-c>', '"+yi')
map('v', '<C-x>', '"+c')
map('n', '<C-x>', '"+c')
map('v', '<C-v>', 'c<ESC>--+p')
map('i', '<C-v>', '<ESC>--+pa')

-- Emmet Vim
g.user_emmet_leader_key=','

-- Tab Completion
map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- Hover Docs
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

-- Single letter mappings
map('n', '<leader>=', '<C-W>=')
map('n', '<leader>h', '<C-W>h')
map('n', '<leader>v', '<C-W>v')
map('n', '<leader>d', ':bd<CR>')
map('n', '<leader>e', ':NvimTreeToggle<CR>:NvimTreeRefresh<CR>')
map('n', '<leader>g', ':Neogit<CR>')
map('n', '<leader>/', '<Plug>kommentary_line_default', { noremap = false })
map('v', '<leader>/', '<Plug>kommentary_visual_default<Esc>', { noremap = false })

-- a stands for Actions
map('n', '<leader>as', ':let @/ = ""<CR>')

-- b stands for Buffer
map('n', '<leader>bb1', ':b1<CR>')
map('n', '<leader>bb2', ':b2<CR>')
map('n', '<leader>bb3', ':b3<CR>')
map('n', '<leader>bb4', ':b4<CR>')
map('n', '<leader>bb5', ':b5<CR>')
map('n', '<leader>bb6', ':b6<CR>')
map('n', '<leader>bb7', ':b7<CR>')
map('n', '<leader>bb8', ':b8<CR>')
map('n', '<leader>bb9', ':b9<CR>')
map('n', '<leader>bf', ':bfirst<CR>')
map('n', '<leader>bl', ':blast<CR>')
map('n', '<leader>bn', ':bnext<CR>')
map('n', '<leader>bp', ':bprevious<CR>')
map('n', '<leader>bd', ':bd<CR>')
map('n', '<leader>bL', ':ls<CR>')

-- l stands for Language Server Protocol
map('n', '<leader>la', "<cmd>lua vim.lsp.buf.code_action()<CR>")
map('v', '<leader>la', "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ltr', '<cmd>TSLspRenameFile<CR>')
map('n', '<leader>lti', '<cmd>TSLspImportAll<CR>')
map('n', '<leader>lto', '<cmd>TSLspOrganize<CR>')
map('n', '<leader>ltf', '<cmd>TSLspFixCurrent<CR>')
map('n', '<leader>lR', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>ll', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

-- n stands for Navigation (navigate in file)
map('n', '<leader>nf', ':Telescope find_files<CR>')
map('n', '<leader>ng', ':Telescope live_grep<CR>')
map('n', '<leader>nt', ':TodoTelescope<CR>')

-- w standas for Wiki
map('n', '<leader>ww', ':VimwikiIndex<CR>')
map('n', '<leader>wW', ':VimwikiTabIndex<CR>')
map('n', '<leader>wi', ':VimwikiDiaryIndex<CR>')
map('n', '<leader>wI', ':VimwikiTabDiaryIndex<CR>')
map('n', '<leader>wn', ':VimwikiMakeDiaryNote<CR>')
map('n', '<leader>wN', ':VimwikiTabMakeDiaryNote<CR>')
map('n', '<leader>wy', ':VimwikiMakeYesterdayDiaryNote<CR>')
map('n', '<leader>wt', ':VimwikiMakeTomorrowDiaryNote<CR>')
cmd('autocmd FileType vimwiki nnoremap <buffer> <CR> :VimwikiFollowLink<CR>')
cmd('autocmd FileType vimwiki nnoremap <buffer> <S-CR> :VimwikiSplitLink<CR>')
cmd('autocmd FileType vimwiki nnoremap <buffer> <C-CR> :VimwikiVSplitLink<CR>')
