-- *******************************************
-- Mapping configuration for general settings
-- 
-- The mappings for a specific pluggin can be 
-- found in its config file.
-- *******************************************

-- Simplify the api to create mappings
local map = vim.api.nvim_set_keymap

-- **************************************
-- Map leader to Space or Comma
-- **************************************
--vim.g.mapleader = " "
vim.g.mapleader = ","

-- **************************************
-- Map esc to exit terminal mode
-- **************************************
--map('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- **************************************
-- Map ccedilla to Esc in 
-- **************************************
map('', 'ç', '<Esc>', {noremap = false}) -- Normal, Visual, Select, Operator-pending
map('!', 'ç', '<Esc>', {noremap = false}) -- Insert and Command-line

-- **************************************
-- Move lines up and down with shortcuts
-- **************************************
map('n', '<Leader><C-j>', '<cmd>m+<cr>', {noremap=true})
map('n', '<Leader><C-k>', '<cmd>m-2<cr>', {noremap=true})

-- **************************************
-- Easier split navigation
-- **************************************
map( "", "<C-J>", "<C-W><C-J>", { noremap = true,})
map( "", "<C-K>", "<C-W><C-K>", { noremap = true,})
map( "", "<C-H>", "<C-W><C-H>", { noremap = true,})
map( "", "<C-L>", "<C-W><C-L>", { noremap = true,})

-- **************************************
-- Clear highlights
-- **************************************
map('n', '<Leader><C-h>', '<cmd>noh<cr>', { noremap = true,}) 

