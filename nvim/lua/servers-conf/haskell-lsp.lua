local nvim_lsp = require("lspconfig")

local on_attach = function(client)
    require'completion'.on_attach(client)
    require("lsp-conf")
end

nvim_lsp.hls.setup({
    on_attach=on_attach,
    --cmd = { "haskell-language-server-wrapper", "--lsp" },
    --filetypes = { "haskell", "lhaskell" },
    --root_dir = root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"),
})
