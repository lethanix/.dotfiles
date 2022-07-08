
local lspconfig = require('lspconfig')

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
    vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {'zls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- " Set completeopt to have a better completion experience
-- set completeopt=menuone,noinsert,noselect

-- " Enable completions as you type
-- let g:completion_enable_auto_popup = 1
