-- GENERAL
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.g.mapleader = " "
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.cmd.colorscheme("everforest")

-- SEARCH
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- VISUAL
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.pumheight = 10

-- FILE HANDLING
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

-- NETRW SETTINGS
vim.g.netrw_winsize = 20
vim.g.netrw_keepdir = 0
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- BETTER COPY PAST
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_localmkdir = "mkdir -p"
vim.g.netrw_localrmdir = "rm -r"

-- BEHAVIOR
vim.opt.hidden = true
vim.opt.errorbells = true
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

-- SPLIT
vim.opt.splitbelow = true
vim.opt.splitright = true

