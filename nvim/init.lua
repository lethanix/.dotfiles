if vim.g.vscode then
    require("settings") -- Load general settings
    require("comments")
    require("mappings") -- Load general mappings
else
    require("settings") -- Load general settings
    require("mappings") -- Load general mappings
    require("plugins") -- Load plugins
    require("colorscheme-conf") -- Load nvim theme and colors

    -- Load plugins settings
    require("indent")
    require("comments")
    require("dashboard")
    require("treesitter")
    require("statusline")
    require("autopairs-conf")
    require('telescope-config')

    -- Load LSP settings
    require("lsp-servers")

    require("preview-colors") -- Load color highlighter NOTE: add this line after/below where your plugins are setup.
end
