-- Diagnostic keymaps
local keymap = vim.keymap
local diagnostic = vim.diagnostic

local goto_opts = {
    wrap = true,
    float = true,
}

keymap.set('n', '[d', function()
    diagnostic.goto_prev(goto_opts)
end)

keymap.set('n', ']d', function()
    diagnostic.goto_next(goto_opts)
end)

keymap.set('n' ,"<space>e", function()
    diagnostic.open_float(0, {
	scope = "line",
	})
end)

-- LSP keymaps
local opts = { buffer = true}
keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
keymap.set('n', 'K', vim.lsp.buf.hover, opts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
end, opts)
keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
keymap.set('n', 'gr', vim.lsp.buf.references, opts)
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)

-- Format file commands and keymaps
vim.api.nvim_create_user_command("Format", function ()
    vim.lsp.buf.format{ async = true }
end, {})

keymap.set('n', '<leader>df', function ()
    vim.lsp.buf.format { async = true }
end )
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format { async=true }]]

-- -- Enable the following language servers
-- local servers = {
--	'rust_analyzer',
--	'sumneko_lua',
--	-- 'bashls',
-- }

-- for _, lsp in ipairs(servers) do
--	lspconfig[lsp].setup {
--		on_attach = on_attach,
--		-- capabilities = capabilities,
--   }
-- end

-- Use LSP as the handler for formatexpr.
--    See `:help formatexpr` for more information.
vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    },
    update_in_insert = true,
})
