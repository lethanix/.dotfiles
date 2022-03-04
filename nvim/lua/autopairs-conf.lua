local npairs = require('nvim-autopairs')
-- local Cond= require('nvim-autopairs.conds')
-- local ts_conds = require('nvim-autopairs.ts-conds')
-- local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.setup({
    -- ONLY WORKS ON THE TERMINAL
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = -1, -- Offset from pattern match
        end_key = 'L',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
    check_ts = true
    -- ignored_next_char = false
    -- enable_check_bracket_line = false
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({
    map_cr = false,
    map_complete = true,
    map_char = {
        tex = '',
    },
}))

---- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
--cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

