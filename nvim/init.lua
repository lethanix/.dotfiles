require("plugins")  -- Load plugins
require("settings") -- Load general settings

-- Load general mappings
require("mappings")

-- Load plugins settings 
require("minimap")
require("focus-win") -- Focus active windows
require("shade-win") -- Dim inactive windows
require("lsp-icons")
require("true-zen-conf")
require("treesitter")
require("buffertabs")
require("autopairs-conf")
require("indent")
require("statusline")
require('telescope-config')
require('nvim-ts-rainbow')

-- Load LSP settings
require("compe-conf")
require("rust")
require("swift")
require("lua-lsp")
require("bash-lsp")
require("julia-server")
require("type-javascript")
require("html-lsp")

-- Load a high-performance color highlighter for Neovim
-- NOTE: You should add this line after/below where your
-- plugins are setup.
require("colors-preview")
--require'colorizer'.setup()

