vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

map('n', '<C-h>', '<C-w>h', {noremap = true, silent=false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent=false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent=false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent=false})
map('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
map('v', '<', '<gv', {noremap = true, silent=false})
map('v', '>', '>gv', {noremap = true, silent=false})

-- Remaps of keys 
vim.api.nvim_set_keymap('n', '0', '^', { noremap = true, silent = true })
