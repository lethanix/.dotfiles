local nvim_lsp = require("lspconfig")
util = require "lspconfig/util"

local on_attach = function()
    require("cmp-conf")
    require("lsp-conf")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.gopls.setup({
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    on_attach = on_attach,
})
