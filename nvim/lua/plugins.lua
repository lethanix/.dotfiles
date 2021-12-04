
-- Neovim automatically run :PackerCompile whenever plugins.lua is updated 
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
    -- Dim inactive windows
    use { "beauwilliams/focus.nvim" }
    use 'sunjon/shade.nvim'
    use 'blueyed/vim-diminactive'

    -- post install (yarn install | npm install) then load plugin only for editing supported files
    use {'prettier/vim-prettier', run = 'yarn install' }

    -- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
    use "onsails/lspkind-nvim"

    -- Provide a cleaner and less cluttered interface
    use "Pocco81/TrueZen.nvim"

    use {
	"folke/twilight.nvim",
	config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

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
    use 'rktjmp/lush.nvim'
    use 'EdenEast/nightfox.nvim'
    --use 'Mofiqul/dracula.nvim'
    use 'dracula/vim'
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    --use 'morhetz/gruvbox'
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

    -- Adds indentation guides to all lines (including empty lines).
    use {'lukas-reineke/indent-blankline.nvim'}

    -- Brackets color
    use {'p00f/nvim-ts-rainbow'}

    -- Status line
    use {'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require("statusline") end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- File navigation
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'kyazdani42/nvim-tree.lua' }
    
    -- Buffer tabs
    use { 'akinsho/nvim-bufferline.lua' }
    
    -- Language Server Client
    use { 'neovim/nvim-lspconfig' }
    use { 'simrat39/rust-tools.nvim'}
    use { 'nvim-lua/completion-nvim' }
    use {'hrsh7th/nvim-compe'}
    use { 'JuliaEditorSupport/julia-vim' }
    use {'nvim-lua/lsp_extensions.nvim'}
    
    -- Brackets completition 
    use { 'windwp/nvim-autopairs' }
    
    -- Show colors
    --use { 'ap/vim-css-color' }
    use { 'norcalli/nvim-colorizer.lua' }

    -- Minimap text 
    use {'wfxr/minimap.vim'}


end) 

