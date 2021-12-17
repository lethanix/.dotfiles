-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
--local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

--local map = vim.api.nvim_set_keymap

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

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
-- Color scheme
-- **************************************
cmd 'let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"'
cmd 'let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"'
o.termguicolors = true

local colorsch = "ayu"
cmd 'let ayucolor = "mirage"'

if "spaceduck" == colorsch  then cmd 'colorscheme spaceduck'

elseif "nightfly" then
    cmd [[colorscheme nightfly]]
    g.nightflyNormalFloat = 1
elseif "dracula" == colorsch then
    o.background = "dark"
    vim.cmd[[colorscheme dracula]]

elseif "gruvbox" == colorsch then
    g.gruvbox_contrast_dark = "hard" -- soft, medium or hard
    g.gruvbox_contrast_light = "soft"
    g.gruvbox_italic = 1
    o.background = "dark" -- or "light" for light mode
    cmd([[colorscheme gruvbox]])
elseif "fox" == colorsch then
	local nightfox = require('nightfox')
	-- This function set the configuration of nightfox. If a value is not passed in the setup function
	-- it will be taken from the default configuration above
	nightfox.setup({
	 	fox = "nightfox", -- change the colorscheme to use nordfox
	 	styles = {
	 	  comments = "italic", -- change style of comments to be italic
	 	  keywords = "italic", -- change style of keywords to be bold
                  --strings = "regular",
	 	  --functions = "italic" -- styles can be a comma separated list
	 	},
	})
	-- Load the configuration set above and apply the colorscheme
	nightfox.load()
elseif "cal" == colorsch  then require('calvera').set()
elseif "ayu" == colorsch  then cmd 'colorscheme ayu'
elseif "nord" == colorsch  then cmd 'colorscheme nord'
elseif "srcery" == colorsch  then cmd 'colorscheme srcery'
elseif "night" == colorsch  then cmd 'colorscheme night-owl'
elseif "material" == colorsch  then
    g.material_style = "deep ocean"
    require('material-conf')
    cmd 'colorscheme material'
    --require('material').set()
elseif "tokyo" == colorsch  then
    g.tokyodark_transparent_background = true
    g.tokyodark_enable_italic_comment = true
    g.tokyodark_enable_italic = true
    g.tokyodark_color_gamma = "0.90"
    cmd 'colorscheme tokyodark'
elseif "github" == colorsch  then
    require('github-theme').setup({
        themeStyle = "dark_default",
        functionStyle = "italic",
    	darkSidebar = true,
    	darkFloat = true,
    })
end

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
wo.wrap = false

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
bo.tabstop = indent*2
bo.softtabstop = 0
bo.shiftwidth = indent
bo.expandtab = true

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

