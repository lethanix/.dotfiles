local nvim_lsp = require("lspconfig")

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.sumneko_lua.setup({
		on_attach = on_attach,
		settings{
				
		}
})
