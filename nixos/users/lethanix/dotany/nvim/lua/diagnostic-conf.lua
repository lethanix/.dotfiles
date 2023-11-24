local diagnostic = vim.diagnostic

diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    },
    update_in_insert = true,
})

-- TODO: Fix signs for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic keymaps
local goto_opts = {
    wrap = true,
    float = true,
}
vim.keymap.set('n', '[d', function() diagnostic.goto_prev(goto_opts) end)
vim.keymap.set('n', ']d', function() diagnostic.goto_next(goto_opts) end)
vim.keymap.set('n' ,"<space>e", function()
    diagnostic.open_float(0, {
	scope = "line",
    })
end)

