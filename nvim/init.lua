if vim.g.vscode then
    require("settings") -- Load general settings
    require("comments")
    -- Load general mappings
    require("mappings")
else
    require("settings") -- Load general settings
    require("mappings") -- Load general mappings
    require("plugins")  -- Load plugins
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
    -- require("go")
    -- require("python-lsp")
    -- require("java-lsp")
    -- require("rust")
    -- require("swift")
    -- require("lua-lsp")
    -- require("bash-lsp")
    -- require("zig-server")
    -- require("julia-server")
    -- -- require("type-javascript")
    -- require("deno-lsp")
    -- require("html-lsp")
    -- require("haskell-lsp")
    -- require("latex")

    -- Load a high-performance color highlighter for Neovim
    -- NOTE: You should add this line after/below where your
    -- plugins are setup.
    require("preview-colors")
end
