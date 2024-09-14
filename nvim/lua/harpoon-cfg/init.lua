local harpoon = require("harpoon")
local ui = require("harpoon.ui")

settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    save_on_change = true,
    mark_branch = true,
    key = function()
        return vim.loop.cwd()
    end,
}

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<A-m>", function() harpoon:list():add() end)
vim.keymap.set("n", "<A-q>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end)
