-- ****************************************************************
-- Bootstrap lazy
-- ****************************************************************
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ****************************************************************
-- ****************************************************************

require("settings") -- Load general settings
require("mappings") -- Load general mappings
require("lazy").setup("plugins") -- Load plugins
require("colorscheme_conf") -- Load nvim theme and colors

-- Load plugins settings
require("null")
-- require("indent")
require("comments")
require("dashboard")
require("treesitter")
require("statusline")
require("autopairs-conf")
require('telescope-config')

-- Load LSP settings
require("lsp-servers")

if vim.g.neovide then
require("neovide_conf")
end

require("preview-colors") -- Load color highlighter NOTE: add this line after/below where your plugins are setup.
