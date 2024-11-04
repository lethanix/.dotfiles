-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

--**********************************************
-- Colorscheme configuration
--**********************************************
-- Change the color scheme depending of the system preference:
function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
        return 'Tokyo Night'
        -- return "Catppuccin Mocha"
    else
        return 'Tokyo Night Day'
        -- return "Catppuccin Latte"
    end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

--**********************************************
-- Font configuration
--**********************************************
-- config.font = wezterm.font 'SpaceMono Nerd Font'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 17

--**********************************************
-- Tab bar and window decorations configuration
--**********************************************
config.enable_tab_bar = false
-- config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
