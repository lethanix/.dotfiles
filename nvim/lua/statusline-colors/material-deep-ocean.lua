local colors = require("statusline-colors.material")
-- ****************************************
-- Colors according the vim mode
-- ****************************************
return {
    n = colors.green,
    i = colors.orange,
    v=colors.yellow,
    [''] = colors.yellow,
    V=colors.yellow,
    c = colors.cyan,
    no = colors.red,
    s = colors.orange,
    S=colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.orange,
    Rv = colors.purple,
    cv = colors.red,
    ce=colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!']  = colors.red,
    t = colors.red
}

