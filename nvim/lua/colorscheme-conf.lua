-- **************************************
-- Color scheme
-- **************************************
-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

cmd 'let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"'
cmd 'let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"'
o.termguicolors = true

--local colorsch = "material"
--local colorsch = "dracula"
local colorsch = "gruvbox"
cmd 'let ayucolor = "mirage"'

-- **************************************
-- Font
-- **************************************
o.guifont="SpaceMono Nerd Font:h13"
--o.guifont="JetBrainsMono Nerd Font:h13"
--o.guifont="FiraCode Nerd Font:h13"

if "spaceduck" == colorsch  then cmd 'colorscheme spaceduck'
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
    nightfox.load()
elseif "cal" == colorsch  then require('calvera').set()
elseif "ayu" == colorsch  then cmd 'colorscheme ayu'
elseif "nord" == colorsch  then cmd 'colorscheme nord'
elseif "srcery" == colorsch  then cmd 'colorscheme srcery'
elseif "night" == colorsch  then cmd 'colorscheme night-owl'
elseif "material" == colorsch  then
    g.material_style = "deep ocean"
    require('material-conf')
    cmd [[colorscheme material]]
    --require('material').set()
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

g.neovide_floating_blur = true
g.neovide_floating_opacity = 0.87

g.neovide_window_floating_opacity = 0.87
g.neovide_remember_window_size = true
g.neovide_cursor_animation_length = 0.10
g.neovide_cursor_antialiasing = false
g.neovide_no_idle = false

