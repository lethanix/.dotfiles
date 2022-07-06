-- *******************************************
-- Mapping configuration for general settings
--
-- The mappings for a specific pluggin can be
-- found in its config file.
-- *******************************************

-- Simplify the api to create mappings
local map = vim.keymap.set

-- **************************************
-- Map leader to Space or Comma
-- **************************************
--vim.g.mapleader = ' '
vim.g.mapleader = ','

-- **************************************
-- Map esc to exit terminal mode
-- **************************************
map('t', '<Esc>', '<C-\\><C-n>')

-- **************************************
-- Map ccedilla to Esc in
-- **************************************
map('', 'ç', '<Esc>', {noremap = false}) -- Normal, Visual, Select, Operator-pending
map('!', 'ç', '<Esc>', {noremap = false}) -- Insert and Command-line

-- **************************************
-- Move lines up and down with shortcuts
-- **************************************
map('n', '<Leader><C-j>', '<cmd>m+<cr>')
map('n', '<Leader><C-k>', '<cmd>m-2<cr>')

-- **************************************
-- Easier split navigation
-- **************************************
map('n', '<Leader>j', '<C-W><C-J>')
map('n', '<Leader>k', '<C-W><C-K>')
map('n', '<Leader>h', '<C-W><C-H>')
map('n', '<Leader>l', '<C-W><C-L>')

-- **************************************
-- Easier buffer navigation
-- **************************************
map('n', ']b', '<cmd>bn<cr>')
map('n', '[b', '<cmd>bp<cr>')

-- **************************************
-- Easier tab navigation
-- **************************************
map('n', ']t', '<cmd>tabnext<cr>')
map('n', '[t', '<cmd>tabprev<cr>')

-- **************************************
-- Clear highlights
-- **************************************
map('n', '<Leader><C-h>', '<cmd>noh<cr>')

-- **************************************
-- Toggle styles
-- **************************************
map('n', '<leader>mm', function ()
    require('material.functions').toggle_style()
end)
