-- By default, the highlight groups are setup as such:
--   hi default link FocusedWindow VertSplit
--   hi default link UnfocusedWindow Normal
-- To change them, you can link them to a different highlight group, see `:h hi-default` for more info.
--vim.cmd('hi default link UnfocusedWindow StatusLineNC')

vim.cmd [[hi default link UnfocusedWindow EndOfBuffer]]
vim.cmd [[hi default link FocusedWindow Normal]]

require("focus").setup({
    excluded_filetypes = {"-MINIMAP-", "minimap"},
    excluded_buftypes = {"-MINIMAP-", "minimap"},
    --excluded_buftypes = { "-MINIMAP-"},
    bufnew = false,
    winhighlight = true,
    cursorline = true,
    --hybridnumber = true,
    relativenumber = true,
    compatible_filetrees = {"nvimtree"},
    treewidth = 10,
})

-- Recommended commands, leverage hjkl to move and create your splits directionally with ease
local map = vim.api.nvim_set_keymap
map('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
map('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
map('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
map('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })


