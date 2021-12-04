require('nvim-autopairs').setup({
    enable_moveright = false
})

require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
 --   enable_check_bracket_line = false
})
