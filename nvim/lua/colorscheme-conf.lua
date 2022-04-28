-- **************************************
-- Color scheme
-- **************************************
-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

cmd [[ let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum" ]]
cmd [[ let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum" ]]
o.termguicolors = true

-- local colorsch = "kanagawa"
local colorsch = "material"
--local colorsch = "dracula"
--local colorsch = "onedark"
--local colorsch = "gotham"
--cmd 'let ayucolor = "mirage"'

-- **************************************
-- Font
-- **************************************
-- o.guifont="SpaceMono Nerd Font:h13"
-- o.guifont="DMMono Nerd Font:h14"
-- o.guifont="Lilex Nerd Font:h13"
o.guifont="JetBrainsMono Nerd Font:h13"
--o.guifont="FiraCode Nerd Font:h13"

if "spaceduck"  == colorsch  then cmd 'colorscheme spaceduck'
elseif "material"  == colorsch  then
    g.material_style = "deep ocean"
    require('material-conf')
    cmd [[colorscheme material]]
    --require('material').set()
elseif "kanagawa" == colorsch then
    require('kanagawa').setup({
        undercurl = true,           -- enable undercurls
        commentStyle = "italic",
        functionStyle = "NONE",
        keywordStyle = "italic",
        statementStyle = "bold",
        typeStyle = "NONE",
        variablebuiltinStyle = "italic",
        specialReturn = true,       -- special highlight for the return keyword
        specialException = true,    -- special highlight for exception handling keywords
        transparent = false,        -- do not set background color
        dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
        colors = {},
        overrides = {},
    })

    -- setup must be called before loading
    cmd[[colorscheme kanagawa]]

elseif "gotham" == colorsch then
    cmd [[colorscheme gotham]]
elseif "onedark" then
    require('onedark').setup {
        -- Default theme style. Choose between 'dark', 'darker', 'cool',
        -- 'deep', 'warm', 'warmer' and 'light'
        style = 'deep',
        transparent = false,  -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        -- toggle theme style ---
        toggle_style_key = '<leader>ss', -- Default keybinding to toggle
        toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
        code_style = {
            comments = 'italic',
            keywords = 'none',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
            darker = true, -- darker colors for diagnostic
            undercurl = true,   -- use undercurl instead of underline for diagnostics
            background = true,    -- use background color for virtual text
        },
    }
    require('onedark').load()

elseif "dracula" == colorsch then
    o.background = "dark"
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
elseif "github" == colorsch  then
    require('github-theme').setup({
        themeStyle = "dark_default",
        functionStyle = "italic",
    	darkSidebar = true,
    	darkFloat = true,
    })
end

-- **************************************
-- Neovide specific
-- **************************************
g.neovide_transparency = 1
-- g.neovide_transparency = 0.93

g.neovide_floating_blur = true
g.neovide_floating_opacity = 0.87

g.neovide_window_floating_opacity = 0.87
g.neovide_remember_window_size = false
g.neovide_cursor_animation_length = 0.15
g.neovide_cursor_antialiasing = true
g.neovide_no_idle = false

