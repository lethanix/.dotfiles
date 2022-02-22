local nvim_lsp = require("lspconfig")

local on_attach = function(client)
    require'completion'.on_attach(client)
    require("lsp-conf")
    vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)]]
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
                importEnforceGranularity = true
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

