-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

o.guifont="Lethani JetBrainsMono,JetBrainsMono Nerd Font:h21"
-- o.guifont="JetBrainsMono NF:h15"

-- **************************************
-- Neovide specific
-- **************************************

if vim.g.neovide then
    g.neovide_transparency = 1
    -- g.neovide_transparency = 0.93
    g.neovide_floating_blur = true
    g.neovide_floating_opacity = 0.87
    g.neovide_window_floating_opacity = 0.87
    g.neovide_remember_window_size = false
    g.neovide_cursor_animation_length = 0.15
    g.neovide_cursor_antialiasing = true
    g.neovide_no_idle = true
    g.neovide_underline_automatic_scaling = false
    g.neovide_scale_factor = 1
    g.neovide_font_hinting = 'Normal'
    g.neovide_font_edging = 'SubPixelAntiAlias'
end

-- **************************************
-- Color scheme
-- **************************************
cmd [[ let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum" ]]
cmd [[ let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum" ]]
o.termguicolors = true

local colorsch = "tokyo"
-- local colorsch = "kanagawa"
-- local colorsch = "material"
-- local colorsch = "dracula"
-- local colorsch = "onedark"
-- local colorsch = "catppuccin"
-- local colorsch = "gotham"

cmd 'let ayucolor = "mirage"'

if "spaceduck"  == colorsch  then cmd 'colorscheme spaceduck'
elseif "catppuccin" == colorsch then
    local catppuccin = require("catppuccin")
    -- configure it
    catppuccin.setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
        transparent_background = false,
        term_colors = true,
	compile = {
		enabled = false,
		path = vim.fn.stdpath "cache" .. "/catppuccin",
	},
        styles = {
        	comments ={ "italic"},
        	conditionals = {"italic"},
        	loops = {},
        	functions = {"italic"},
        	keywords = {"italic"},
        	strings = {"underline"},
        	variables = {},
        	numbers = {},
        	booleans = {},
        	properties = {},
        	types = {},
        	operators = {},
        },
        integrations = {
        	treesitter = true,
        	native_lsp = {
        		enabled = true,
        		virtual_text = {
        			errors = 	{"italic"},
        			hints = 	{"italic"},
        			warnings = 	{"italic"},
        			information = 	{"italic"},
        		},
        		underlines = {
        			errors = 	{"underline"},
        			hints = 	{"underline"},
        			warnings = 	{"underline"},
        			information = 	{"underline"},
        		},
        	},
            coc_nvim = false,
        	lsp_trouble = false,
        	cmp = true,
        	lsp_saga = false,
        	gitgutter = false,
        	gitsigns = true,
        	telescope = true,
        	nvimtree = {
        		enabled = true,
        		show_root = false,
        		transparent_panel = false,
        	},
        	neotree = {
        		enabled = false,
        		show_root = false,
        		transparent_panel = false,
        	},
        	which_key = false,
        	indent_blankline = {
        		enabled = true,
        		colored_indent_levels = false,
        	},
        	dashboard = true,
        	neogit = false,
        	vim_sneak = false,
        	fern = false,
        	barbar = false,
        	bufferline = true,
        	markdown = true,
        	lightspeed = false,
        	ts_rainbow = false,
        	hop = false,
        	notify = true,
        	telekasten = true,
        	symbols_outline = true,
        }
    })
    g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    cmd [[colorscheme catppuccin]]
elseif "material"  == colorsch  then
    require('material-conf')

    g.material_style = "deep ocean"
    -- g.material_style = "palenight"

    cmd [[colorscheme material]]
elseif "kanagawa" == colorsch then
    require('kanagawa').setup({
        undercurl = true,           -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true},
        specialReturn = true,       -- special highlight for the return keyword
        specialException = true,    -- special highlight for exception handling keywords
        transparent = false,        -- do not set background color
        dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,       -- adjust window separators highlight for laststatus=3
        colors = {},
        overrides = {},
    })

    -- setup must be called before loading
    cmd[[colorscheme kanagawa]]
elseif "gotham" == colorsch then
    cmd [[colorscheme gotham256]]
-- elseif "onedark" then
--     require('onedark').setup {
--         -- Default theme style. Choose between 'dark', 'darker', 'cool',
--         -- 'deep', 'warm', 'warmer' and 'light'
--         style = 'darker',
--         transparent = false,  -- Show/hide background
--         term_colors = false, -- Change terminal color as per the selected theme style
--         ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--         -- toggle theme style ---
--         toggle_style_key = '<leader>cs', -- Default keybinding to toggle
--         toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

--         -- Change code style ---
--         -- Options are italic, bold, underline, none
--         -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
--         code_style = {
--             comments = 'italic',
--             keywords = 'italic',
--             functions = 'italic',
--             strings = 'underline',
--             variables = 'none'
--         },

--         -- Custom Highlights --
--         colors = {}, -- Override default colors
--         highlights = {}, -- Override highlight groups

--         -- Plugins Config --
--         diagnostics = {
--             darker = true, -- darker colors for diagnostic
--             undercurl = true,   -- use undercurl instead of underline for diagnostics
--             background = true,    -- use background color for virtual text
--         },
--     }
--     require('onedark').load()
--     -- cmd [[colorscheme onedark]]
elseif "dracula" == colorsch then
    -- o.background = "dark"
    cmd [[colorscheme dracula]]
elseif "gruvbox" == colorsch then
    g.gruvbox_contrast_dark = "hard" -- soft, medium or hard
    g.gruvbox_contrast_light = "soft"
    g.gruvbox_bold = 0
    g.gruvbox_italic = 1
    g.gruvbox_italicize_strings = 1
    o.background = "dark" -- or "light" for light mode
    cmd [[colorscheme gruvbox]]
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
    -- nightfox.load()
    cmd [[colorscheme nightfox ]]
elseif "cal" == colorsch  then require('calvera').set()
elseif "ayu" == colorsch  then cmd 'colorscheme ayu'
elseif "nord" == colorsch  then cmd 'colorscheme nord'
elseif "srcery" == colorsch  then cmd 'colorscheme srcery'
elseif "night" == colorsch  then cmd 'colorscheme night-owl'
elseif "tokyo" == colorsch  then 
    g.tokyodark_transparent_background = false
    g.tokyodark_enable_italic_comment = true
    g.tokyodark_enable_italic = true
    g.tokyodark_color_gamma = "1.0"
    cmd 'colorscheme tokyodark'
elseif "github" == colorsch  then
    require('github-theme').setup({
        themeStyle = "dark_default",
        functionStyle = "italic",
    	darkSidebar = true,
    	darkFloat = true,
    })
end


