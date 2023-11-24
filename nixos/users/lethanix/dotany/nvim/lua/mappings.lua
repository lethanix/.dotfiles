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
vim.g.mapleader = ' '
-- vim.g.mapleader = ','

-- **************************************
-- The Primeagen powerful keymaps
-- **************************************
-- Move lines selected in visual mode (using the move command)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Map explorer
map("n", "<leader>pv", vim.cmd.Ex)

-- Override Join lines to place cursor at the same spot
map("n", "J", "mzJ`z")

-- Nicer scroll/jump/search navigation
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep same yank after highlighting and paste
map('x', '<leader>p', "\"_dP")

-- Quick Fix navigation
map('n', '<C-k>', '<cmd>cnext<CR>zz')
map('n', '<C-j>', '<cmd>cprev<CR>zz')
map('n', '<leader>k', '<cmd>lnext<CR>zz')
map('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Replace the word that I'm on
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "Q", "<nop>")

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
