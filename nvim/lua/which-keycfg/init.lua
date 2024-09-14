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
  { "<leader>q", ":q<cr>", desc = "Quit" },
  { "<leader>w", ":w<cr>", desc = "Save" },
  { "<leader>x", ":bdelete<cr>", desc = "Close Buffer" },
  { "<leader>E", ":e ~/.config/nvim/init.lua<cr>", desc = "Edit config" },
  
  -- File group
  { "<leader>f", group = "File" },  -- Group name
  { "<leader>ff", ":Telescope find_files<cr>", desc = "Find Files" },
  { "<leader>fr", ":Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>fb", ":Telescope buffers<cr>", desc = "Buffers" },

  -- Terminal group
  { "<leader>t", group = "Terminal" },  -- Group name
  { "<leader>tt", ":ToggleTerm<cr>", desc = "Split Below" },
  { "<leader>tf", toggle_float, desc = "Floating Terminal" },
}

-- Register the mappings
wk.add(mappings)

