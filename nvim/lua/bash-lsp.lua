local nvim_lsp = require("lspconfig")

local on_attach = function(client)
    --require'completion'.on_attach(client)
    require("cmp-conf")
    --require("lsp-conf")
end

nvim_lsp.bashls.setup({
    on_attach = on_attach
})
