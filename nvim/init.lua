require("settings") -- Load general settings
require("plugins")  -- Load plugins
require("colorscheme-conf")
require("notify-conf")

-- Load general mappings
require("mappings")

-- Load plugins settings
require("nvimtree")
require("scroll")
require("dashboard")
require("treesitter")
require("autopairs-conf")
require("indent")
require("statusline")
require('telescope-config')
require('nvim-ts-rainbow')

-- Load LSP settings
require("cmp-conf")
require("go")
require("rust")
require("swift")
require("lua-lsp")
require("bash-lsp")
require("julia-server")
--require("type-javascript")
require("deno-lsp")
require("html-lsp")
require("haskell-lsp")

-- Load a high-performance color highlighter for Neovim
-- NOTE: You should add this line after/below where your
-- plugins are setup.
require("colors-preview")
--require'colorizer'.setup()

