local nvim_lsp = require("lspconfig")

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
    vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.texlab.setup{
    on_attach = on_attach,
    capabilities = capabilities,
	settings = {
		texlab = {
			build = {
				executable = "lualatex",
				-- executable = "tectonic",
				-- args = {
				-- 	"-X",
				-- 	"build",
				-- 	"--keep-logs",
				-- 	"--keep-intermediates",
				-- },
			    onSave = true,
			}
		},
	}
}
