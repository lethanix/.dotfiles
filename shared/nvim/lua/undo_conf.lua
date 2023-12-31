vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- **************************************
-- Undotree map
-- **************************************
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
