-- Diagnostic keymaps
local goto_opts = {
  wrap = true,
  float = true,
}

vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_prev(goto_opts)
end)

vim.keymap.set('n', ']d', function()
	vim.diagnostic.goto_next(goto_opts)
end)

vim.keymap.set('n' ,"<space>e",
  function()
    vim.diagnostic.open_float(0, {
      scope = "line",
    })
  end
)

-- LSP keymaps
local opts = { buffer = true}
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<leader>wl', function()
	vim.inspect(vim.lsp.buf.list_workspace_folders())
end, opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
--
-- -- Enable the following language servers
-- local servers = {
-- 	'rust_analyzer',
-- 	'sumneko_lua',
-- 	-- 'bashls',
-- }

-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup {
-- 		on_attach = on_attach,
-- 		-- capabilities = capabilities,
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

vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    },
    update_in_insert = true,
})
