vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.undofile = true

vim.wo.wrap = false
vim.o.showmode = false
vim.o.writebackup = false
vim.o.showcmd = false

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.textwidth = 80
vim.o.updatetime = 50
vim.o.timeoutlen = 300
vim.o.showtabline = 2
vim.o.pumheight = 10
vim.o.scrolloff = 10

vim.wo.colorcolumn = '+1'
vim.bo.iskeyword = vim.bo.iskeyword .. ',-'
vim.bo.matchpairs = vim.bo.matchpairs .. ',<:>'
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.completeopt = 'menu,menuone,noselect' -- remove preview
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store
]]

vim.o.undodir = vim.fn.stdpath('cache')..'/undodir'

vim.g.netrw_dirhistmax = 0
