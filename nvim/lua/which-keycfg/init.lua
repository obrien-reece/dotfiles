local wk = require("which-key")

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = "lazygit", direction = "float"})
  return lazygit:toggle()
end

local mappings = {
  q = {':q<cr>', "Quit"},
  w = {':w<cr>', "Save"},
  x = {':bdelete<cr>', "Close Buffer"},
  E = {':e ~/.config/nvim/init.lua<cr>', "Edit config"},
  f = {":Telescope find_files<cr>", 'Telescope Find Files'},
  r = {":Telescope live_grep<cr>", 'Telescope Live Grep'},
  b = {":Telescope buffers<cr>", 'Telescope Buffers'},

  t = {
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float , "Floating Terminal" },
    -- l = { minimize_terminal, "LazyGit" }
  },
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)
