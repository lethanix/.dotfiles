-- **************************************
-- Minimap config
-- **************************************
vim.g.minimap_width = 10
vim.g.minimap_left = 0
vim.g.minimap_block_filetypes = {'NvimTree', 'TZAtaraxis'}
vim.g.minimap_close_buftypes = {'terminal'}
vim.g.minimap_git_colors = 1

-- Open the minimap when the file is opened
vim.g.minimap_auto_start = 0
vim.g.minimap_auto_start_win_enter = 0

-- Color of lines at the cursor and not in the cursor
vim.g.minimap_highlight_range = 1 -- Chage to 1 to color all lines visible in the current window
vim.g.minimap_highlight = 'WildMenu'
vim.g.minimap_base_highlight = 'Conceal'

-- Highlight matches to the last search
vim.g.minimap_highlight_search = 1
vim.g.minimap_search_color = 'SpecialKey'

-- Mappings for minimap
local map = vim.api.nvim_set_keymap
map( "", "<leader>m", ":MinimapToggle<CR>", { noremap = true, silent = true })
