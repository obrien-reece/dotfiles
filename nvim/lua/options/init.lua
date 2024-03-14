vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.clipboard = 'unnamedplus'
vim.o.scrolloff = 6
vim.o.sidescrolloff = 20
vim.o.mouse = 'a'
vim.wo.wrap = false
vim.wo.number = true
vim.opt.relativenumber = true
vim.o.cursorline = true
vim.wo.signcolumn = 'yes'
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100

vim.opt.listchars = {eol = '↴'}
vim.opt.list = true

vim.opt.fillchars = { eob = " "}
vim.opt.swapfile = false
