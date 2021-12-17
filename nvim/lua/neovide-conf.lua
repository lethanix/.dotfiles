-- 3 kinds of options: global, buffer-local & window-local
local o = vim.o
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g      -- a table to access global variables

-- **************************************
-- Neovide config
-- **************************************
if g.neovide == true then
    -- **************************************
    -- Colorscheme
    -- **************************************
    --g.gruvbox_contrast_dark = "hard" -- soft, medium or hard
    --g.gruvbox_contrast_light = "soft"
    --g.gruvbox_italic = 1
    --o.background = "dark" -- or "light" for light mode
    --cmd 'colorscheme gruvbox'

    require('material-conf')
    cmd 'colorscheme material'

    -- **************************************
    -- Font
    -- **************************************
    --o.guifont="SpaceMono Nerd Font:h17"
    --o.guifont="CaskaydiaCove Nerd Font:h17"
    o.guifont="JetBrainsMono Nerd Font:h16"
    --o.guifont="FiraCode Nerd Font:h17"

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
    g.neovide_no_idle = true

end

