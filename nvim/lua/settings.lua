-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

-- Highlight on yank
cmd [[au TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]

-- **************************************
-- Cursor configuration
-- **************************************
o.guicursor="n-v-c:block," ..
            "i-ci-ve:ver25," ..
            "r-cr:hor20," ..
            "o:hor50," ..
            "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor," ..
            "sm:block-blinkwait175-blinkoff150-blinkon175"

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
-- The char of End of Buffer is a tilde, change it to space
o.fillchars = "eob: "

-- **************************************
-- Show mode in galaxy status line
-- **************************************
o.showmode = false

-- **************************************
-- Maximum highlight limit
-- **************************************
wo.colorcolumn = "80"
--bo.textwidth = 80
wo.wrap = true

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
local indent = 4
bo.expandtab = true
bo.tabstop = 8
bo.softtabstop = 0
bo.shiftwidth = 4

-- **************************************
-- Folding settings
-- **************************************
wo.foldmethod = "indent"

-- **************************************
-- Fixes mouse issues
-- **************************************
o.mouse = "a"

-- **************************************
-- More natural split opening
-- **************************************
o.splitbelow = true
o.splitright = true

