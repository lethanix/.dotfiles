-- By default, the highlight groups are setup as such:
--   hi default link FocusedWindow VertSplit
--   hi default link UnfocusedWindow Normal
-- To change them, you can link them to a different highlight group, see `:h hi-default` for more info.
vim.cmd('hi default link UnfocusedWindow CursorLineNr')
vim.cmd('hi default link FocusedWindow Normal')

require("focus").setup({
    winhighlight = false,
    cursorline = true,
    --hybridnumber = true,
    --excluded_filetypes = {"nofile","minimap", "-MINIMAP-"},
    --excluded_buftypes = { "nofile", "prompt", "popup", "minimap", "-MINIMAP-"},
    excluded_filetypes = {"minimap", "-MINIMAP-"},
    --compatible_filetrees = { "nvimtree", "nerdtree", "chadtree", "fern" ,"minimap", "-MINIMAP-"},
    treewidth = 1,
})

-- Recommended commands, leverage hjkl to move and create your splits directionally with ease
local map = vim.api.nvim_set_keymap
map('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
map('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
map('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
map('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })


