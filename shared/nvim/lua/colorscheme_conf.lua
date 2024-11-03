-- 3 kinds of' options: global, buffer-local & window-local
local o = vim.o
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g     -- a table to access global variables

local theme = "tokyonight"
local themes = {
    -- gh = "github",
    -- duck = "spaceduck",
    -- moon = "moonlight",
    -- one_dark = "onedark",
    -- tokyo = "tokyodark",
    tokyonight = "tokyonight",
    material = "material",
    cat = "catppuccin",
    kana = "kanagawa",
    ayu = "ayu",
}

-- **************************************
-- Color scheme
-- **************************************
cmd [[ let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum" ]]
cmd [[ let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum" ]]
o.termguicolors = true


if "spaceduck" == themes[theme] then
    cmd [[colorscheme spaceduck]]
elseif "tokyonight" == themes[theme] then
    require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = false,    -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars = "dark",            -- style for sidebars, see below
            floats = "dark",              -- style for floating windows
        },
        sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true,              -- dims inactive windows
        lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors) end,
    })

    cmd [[colorscheme tokyonight]]
elseif "moonlight" == themes[theme] then
    require('moonlight').set()
elseif "catppuccin" == themes[theme] then
    require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.1,
        },
        transparent_background = false,
        term_colors = true,
        compile = {
            enabled = false,
            path = vim.fn.stdpath "cache" .. "/catppuccin",
        },
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = { "italic" },
            functions = { "italic" },
            keywords = { "italic" },
            strings = { "underline" },
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        integrations = {
            fidget = true,
            mason = true,
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
            cmp = true,
            gitsigns = true,
            telescope = true,
            nvimtree = {
                enabled = true,
                show_root = false,
                transparent_panel = false,
            },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true,
            },
            dashboard = true,
            bufferline = true,
            markdown = true,
            notify = true,
            symbols_outline = true,
        }
    })

    cmd [[colorscheme catppuccin]]
elseif "material" == themes[theme] then
    require('material-conf')
    g.material_style = "deep ocean"
    cmd [[colorscheme material]]
elseif "kanagawa" == themes[theme] then
    require('kanagawa').setup({
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true,    -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false,     -- do not set background color
        dimInactive = true,      -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,    -- adjust window separators highlight for laststatus=3
        colors = {},
        overrides = {},
    })

    -- setup must be called before loading
    cmd [[colorscheme kanagawa]]
elseif "onedark" == themes[theme] then
    require('onedark').setup {
        -- Default theme style. Choose between 'dark', 'darker', 'cool',
        -- 'deep', 'warm', 'warmer' and 'light'
        style = 'darker',
        transparent = false,                                                                 -- Show/hide background
        term_colors = false,                                                                 -- Change terminal color as per the selected theme style
        ending_tildes = false,                                                               -- Show the end-of-buffer tildes. By default they are hidden
        -- toggle theme style ---
        toggle_style_key = '<leader>cs',                                                     -- Default keybinding to toggle
        toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
        code_style = {
            comments = 'italic',
            keywords = 'italic',
            functions = 'italic',
            strings = 'underline',
            variables = 'none'
        },

        -- Custom Highlights --
        colors = {},     -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
            darker = true,     -- darker colors for diagnostic
            undercurl = true,  -- use undercurl instead of underline for diagnostics
            background = true, -- use background color for virtual text
        },
    }
    require('onedark').load()
    -- cmd [[colorscheme onedark]]
elseif "dracula" == themes[theme] then
    o.background = "dark"
    cmd [[colorscheme dracula]]
elseif "gruvbox" == themes[theme] then
    g.gruvbox_contrast_dark = "hard" -- soft, medium or hard
    g.gruvbox_contrast_light = "soft"
    g.gruvbox_bold = 0
    g.gruvbox_italic = 1
    g.gruvbox_italicize_strings = 1
    o.background = "dark" -- or "light" for light mode
    cmd [[colorscheme gruvbox]]
elseif "fox" == themes[theme] then
    local nightfox = require('nightfox')
    -- This function set the configuration of nightfox. If a value is not passed in the setup function
    -- it will be taken from the default configuration above
    nightfox.setup({
        fox = "nightfox",        -- change the colorscheme to use nordfox
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
elseif "cal" == themes[theme] then
    require('calvera').set()
elseif "ayu" == themes[theme] then
    cmd [[let ayucolor = "mirage"]]
    cmd [[colorscheme ayu]]
elseif "night-owl" == themes[theme] then
    cmd [[colorscheme night-owl]]
elseif "tokyodark" == themes[theme] then
    g.tokyodark_transparent_background = false
    g.tokyodark_enable_italic_comment = true
    g.tokyodark_enable_italic = true
    g.tokyodark_color_gamma = "1.0"
    cmd [[colorscheme tokyodark]]
elseif "github" == themes[theme] then
    require('github-theme').setup({
        themeStyle = "dark_default",
        functionStyle = "italic",
        darkSidebar = true,
        darkFloat = true,
    })
end
