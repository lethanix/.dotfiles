local colors = require("statusline-colors.gruvbox")
-- ****************************************
-- Colors according the vim mode
-- ****************************************
return {
    n = colors.neutral_orange,                    i = colors.bright_green, v=colors.bright_yellow,
    [''] = colors.bright_yellow,      V=colors.bright_yellow, c = colors.bright_aqua,	    	no = colors.bright_red,	    s = colors.bright_orange, S=colors.bright_orange,	    	[''] = colors.bright_orange,
    ic = colors.bright_yellow,	    	R = colors.bright_purple,	    Rv = colors.bright_purple,
    cv = colors.bright_red,	    	ce=colors.bright_red,		    r = colors.bright_aqua,
    rm = colors.bright_aqua,	    	['r?'] = colors.bright_aqua,
    ['!']  = colors.bright_red,    	t = colors.bright_red
}

