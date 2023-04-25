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

local handlers = require('nvim-autopairs.completion.handlers')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({
    -- map_cr = false,
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
    },
    map_complete = true,
    map_char = {
        tex = '',
    },
}))
