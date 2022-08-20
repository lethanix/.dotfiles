
-- Neovim automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'ggandor/lightspeed.nvim'

    use { 'numToStr/Comment.nvim', }

    -- Dim inactive windows
    --use { "beauwilliams/focus.nvim" }
    --use 'sunjon/shade.nvim'
    --use 'blueyed/vim-diminactive'

    -- Smooth scrholling
    use 'karb94/neoscroll.nvim'

    -- Dashboard/ greeter
    use { 'goolord/alpha-nvim', }

    -- Better-escape.vim is created to help Vim/Nvim users escape insert mode
    -- quickly using their customized key combinations, without experiencing the lag
    use {'jdhao/better-escape.vim', event = 'InsertEnter'}

    -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    use "onsails/lspkind-nvim"

    -- Parsers and color of code
    use {'nvim-treesitter/nvim-treesitter'}

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }

    -- Color scheme
        use({
        	"catppuccin/nvim",
        	as = "catppuccin"
        })
    use "rebelot/kanagawa.nvim"
    use 'whatyouhide/vim-gotham'
    use 'bluz71/vim-nightfly-guicolors'
    use 'rktjmp/lush.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'dracula/vim'
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'shaunsingh/moonlight.nvim'
    use {'ayu-theme/ayu-vim'}
    use { 'pineapplegiant/spaceduck', branch="main" }
    use {'marko-cerovac/material.nvim'}
    use {'arcticicestudio/nord-vim'}
    use {'srcery-colors/srcery-vim'}
    use {'haishanh/night-owl.vim'}
    use {'yashguptaz/calvera-dark.nvim'}
    use {'wadackel/vim-dogrun'}
    use {'tiagovla/tokyodark.nvim'}
    use {'projekt0n/github-nvim-theme'}
    use 'navarasu/onedark.nvim'

    -- Adds indentation guides to all lines (including empty lines).
    use {'lukas-reineke/indent-blankline.nvim'}

    -- Brackets color
    use {'p00f/nvim-ts-rainbow'}

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'kyazdani42/nvim-web-devicons' }

    -- Language Server Client
    --use { 'simrat39/rust-tools.nvim'}
    use { 'neovim/nvim-lspconfig', tag = 'v0.1.3', }

	-- Completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'L3MON4D3/LuaSnip' }

    use { 'JuliaEditorSupport/julia-vim' }
    use { 'nvim-lua/lsp_extensions.nvim' }

    use { 'ziglang/zig.vim' }

    -- Brackets completition
    use { 'windwp/nvim-autopairs' }

    -- Show colors
    use { 'norcalli/nvim-colorizer.lua' }

end)


