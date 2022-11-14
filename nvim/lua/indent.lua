vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- vim.g.indent_blankline_char = ""
-- vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = false
--vim.g.indent_blankline_context_patterns = [['^if', '^println', '^match', '^fn']]
--vim.g.indent_blankline_context_pattern_highlight = {'function': 'fn', 'function': 'println!'}
vim.g.indent_blankline_max_indent_increase = 1
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_show_trailing_blankline_indent = false

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    --char_highlight_list = {
    --    "IndentBlanklineIndent1",
    --    "IndentBlanklineIndent2",
    --    "IndentBlanklineIndent3",
    --    "IndentBlanklineIndent4",
    --    "IndentBlanklineIndent5",
    --    "IndentBlanklineIndent6",
    --},
}
