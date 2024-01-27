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

  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    A = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add worspace folder"},
    R = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove worspace folder"},
    l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "List Workspace Folders"},
    D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type Definition" },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', "rename" },
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', "code action" },
    e = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', "show line diagnostics" },
    q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', "Show loclist" },
  },
  t = {
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    -- l = { minimize_terminal, "LazyGit" }
  },
}
local opts = {prefix = '<leader>'}
wk.register(mappings, opts)



