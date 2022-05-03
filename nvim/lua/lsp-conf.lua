-- Diagnostic keymaps
-- 
local goto_opts = {
  wrap = true,
  float = true,
}

vim.keymap.set('n', '<space>dp', function() vim.diagnostic.goto_prev(goto_opts) end)
vim.keymap.set('n', '<space>dn', function() vim.diagnostic.goto_next(goto_opts) end)

vim.keymap.set('n' ,"<space>sl",
  function()
    vim.diagnostic.open_float(0, {
      scope = "line",
    })
  end
)
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Mappings.

-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }
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
end

-- Enable the following language servers
local servers = {  'rust_analyzer' }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
  }
end

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	-- Enable completion triggered by <c-x><c-o>
-- 	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 	
-- 	-- Mappings.
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = bufnr })
-- 	vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', { buffer = bufnr })
-- end
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = { 'sumneko_lua', 'rust_analyzer' }
-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--   }
-- end
--
-- -- Use LSP as the handler for formatexpr.
-- --    See `:help formatexpr` for more information.
-- -- nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
-- --
-- -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- -- for type, icon in pairs(signs) do
-- --     local hl = "DiagnosticSign" .. type
-- --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- -- end
-- --
-- -- vim.diagnostic.config({
-- --     virtual_text = {
-- --         prefix = '', -- Could be '●', '▎', 'x'
-- --     },
-- --     update_in_insert = true,
-- -- })
