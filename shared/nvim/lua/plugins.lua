return {
    -- Color schemes
    { "catppuccin/nvim",                             name = "catppuccin",                                                                                                                   priority = 1000 },
    { 'marko-cerovac/material.nvim' },

    -- Status line
    { "nvim-tree/nvim-web-devicons",                 lazy = true },
    { "nvim-lualine/lualine.nvim",                   dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Utilities
    { "numToStr/Comment.nvim",                       opts = {},                                                                                                                             lazy = false }, -- "gc" to comment visual regions/lines
    { "lukas-reineke/indent-blankline.nvim",         main = "ibl",                                                                                                                          opts = {} },    -- Adds indentation guides to all lines
    { "goolord/alpha-nvim" },                                                                                                                                                                               -- Dashboard/greeter
    { "max397574/better-escape.nvim",                config = function() require("better_escape").setup() end, },                                                                                           -- Escape using jk/jj
    { "lewis6991/gitsigns.nvim" },

    -- Fuzzy Finder (files, lsp, etc)
    { "nvim-telescope/telescope.nvim",               tag = "0.1.5",                                                                                                                         dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-fzf-native.nvim",    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",             build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-textobjects", depencencies = { "nvim-treesitter/nvim-treesitter" } },

    -- LSP
    {
        "onsails/lspkind.nvim", -- Adds vscode-like pictograms to neovim lsp

        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            opts = {} -- this is equalent to setup({}) function
        },

    },

    { "norcalli/nvim-colorizer.lua" },
}
