-- Neovim automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Status line
    use { 'kyazdani42/nvim-web-devicons' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Motion plugin
    use 'ggandor/lightspeed.nvim'
    -- use {
    --     'ggandor/leap.nvim',
    --     config = function ()
    --         require('leap').add_default_mappings()
    --     end
    -- }
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use { 'lukas-reineke/indent-blankline.nvim' } -- Adds indentation guides to all lines (including empty lines).
    use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    use 'goolord/alpha-nvim' -- Dashboard/ greeter
    use "onsails/lspkind-nvim" -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp

    -- Better-escape.vim is created to help Vim/Nvim users escape insert mode
    -- quickly using their customized key combinations, without experiencing the lag
    use { 'jdhao/better-escape.vim', event = 'InsertEnter' }

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    --  Fuzzy Finder (files, lsp, etc)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Color schemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'rebelot/kanagawa.nvim'
    use 'whatyouhide/vim-gotham'
    use 'dracula/vim'
    use 'ayu-theme/ayu-vim'
    use 'pineapplegiant/spaceduck'
    use 'marko-cerovac/material.nvim'
    use 'tiagovla/tokyodark.nvim'
    use 'navarasu/onedark.nvim'

    -- LSP Configuration and Plugins
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        },
    }

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    use 'JuliaEditorSupport/julia-vim'
    use 'nvim-lua/lsp_extensions.nvim'

    use 'ziglang/zig.vim'

    -- Zellij configuration using kdl
    use 'imsnif/kdl.vim'

    use 'mfussenegger/nvim-jdtls'

    -- Brackets completition
    use 'windwp/nvim-autopairs'

    -- Show colors
    use 'norcalli/nvim-colorizer.lua'

end)
