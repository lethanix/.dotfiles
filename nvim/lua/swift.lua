local nvim_lsp = require("lspconfig")

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
end

nvim_lsp.sourcekit.setup({
    on_attach = on_attach,
})

