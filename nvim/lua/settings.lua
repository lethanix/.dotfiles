-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local api = vim.api
-- local cmd = vim.cmd

-- Never less than 8 characters at the edges while scrolling
vim.opt.scrolloff = 8

-- **************************************
-- Highlight config
-- **************************************
-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank {on_visual = false}",
    group = yankGrp,
})

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- **************************************
-- Encoding
-- **************************************
o.encoding="UTF-8"
bo.fileencoding="UTF-8"

-- **************************************
-- Display numbers of lines
-- **************************************
wo.number = true
wo.relativenumber = true

-- **************************************
-- Global status line
-- **************************************
local statusGrp = vim.api.nvim_create_augroup("JustOnce", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {command = "set laststatus=3", group = statusGrp})

-- **************************************
-- Show mode below the status line
-- **************************************
o.showmode = false

-- **************************************
-- Maximum highlight limit
-- **************************************
-- wo.colorcolumn = "80"
--bo.textwidth = 80
wo.wrap = false
o.breakindent = true

-- **************************************
-- Turn on syntax
-- **************************************
bo.syntax = "enable"
bo.syntax = "on"

-- *****************************************
-- Copy-paste between vim & everything else
-- *****************************************
o.clipboard = "unnamedplus"

-- *****************************************
-- Tabs using 4 spaces
-- *****************************************
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
vim.opt.smartindent = true

-- *****************************************
-- No backup
-- *****************************************
vim.opt.swapfile = false
vim.opt.backup = false

-- **************************************
-- Folding settings
-- **************************************
-- wo.foldmethod = "indent"
wo.foldmethod = "syntax"

-- **************************************
-- Enable mouse mode
-- **************************************
o.mouse = "a"

-- **************************************
-- More natural split opening
-- **************************************
o.splitbelow = true
o.splitright = true

