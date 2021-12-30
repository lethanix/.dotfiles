local nvim_lsp = require("lspconfig")

local on_attach = function(client)
    require'completion'.on_attach(client)
    require("lsp-conf")
end

nvim_lsp.sourcekit.setup({
    on_attach = on_attach,
})

