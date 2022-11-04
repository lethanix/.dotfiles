local nvim_lsp = require("lspconfig")

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
