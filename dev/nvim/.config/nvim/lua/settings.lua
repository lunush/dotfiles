vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.o.termguicolors = true
vim.o.hidden = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.timeout = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.undofile = true
vim.o.ruler = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.modifiable = true

vim.o.errorbells = false
vim.o.showmode = false
vim.o.backup = false
vim.o.wrap = false
vim.o.writebackup = false
vim.o.showcmd = false

vim.o.updatetime = 50
vim.o.timeoutlen = 300
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.showtabline = 2
vim.o.shiftwidth = 2
vim.o.textwidth = 80
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.o.conceallevel = 0
vim.o.pumheight = 10
vim.o.scrolloff = 10

vim.o.background = 'dark'
vim.o.encoding = 'UTF-8'
vim.o.fileencoding = 'UTF-8'
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.colorcolumn = '81'
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.backspace = 'indent,eol,start'
vim.o.iskeyword = '@,48-57,_,192-255,-'
vim.o.formatoptions = 'tcqj'
vim.o.shortmess = 'filnxtToOFc'
vim.o.matchpairs = '(:),{:},[:],<:>'

vim.o.undodir = vim.fn.stdpath('cache')..'/undodir'

vim.g.netrw_dirhistmax = 0
