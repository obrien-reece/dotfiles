local wk = require("which-key")
local Terminal = require('toggleterm.terminal').Terminal

-- ToggleTerm functions
local toggle_float = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end

-- Updated mappings using new WhichKey spec
local mappings = {
  -- Single key mappings
  { "<leader>q", ":q<cr>", desc = "which_key_ignore" },
  { "<leader>w", ":w<cr>", desc = "which_key_ignore" },
  { "<leader>x", ":bdelete<cr>", desc = "Close Buffer" },
  { "<leader>E", ":e ~/.config/nvim/init.lua<cr>", desc = "Edit config" },
  
  -- File group
  { "<leader>f", group = "File" },  -- Group name
  { "<leader>ff", ":Telescope find_files<cr>", desc = "which_key_ignore" },
  { "<leader>fr", ":Telescope live_grep<cr>", desc = "which_key_ignore" },
  { "<leader>fb", ":Telescope buffers<cr>", desc = "which_key_ignore" },

  -- Terminal group
  { "<leader>t", group = "Terminal" },  -- Group name
  { "<leader>tt", ":ToggleTerm<cr>" },
  { "<leader>tf", toggle_float },
}

-- Register the mappings
wk.add(mappings)
