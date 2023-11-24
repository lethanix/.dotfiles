local nvim_lsp = require("lspconfig")

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")

    -- See https://vi.stackexchange.com/questions/31153/neovim-does-not-autoreload-after-a-bufwritepost-maybe-because-the-timestamps-ar
    vim.cmd [[
    function! SwiftFormat()
        silent !swiftformat %
        let view = winsaveview()
        silent edit
        call winrestview(view)
        redraw!
    endfunction

    augroup swiftFormat
        autocmd!
        autocmd BufWritePost * if &filetype ==# 'swift' | call SwiftFormat() | endif
    augroup END
    ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.sourcekit.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

