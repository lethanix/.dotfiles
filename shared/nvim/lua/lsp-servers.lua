-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    tsserver = {},
    clangd = {},
    cmake = {},
    jdtls = {},
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    zls = {},
    bashls = {},
    -- julials = {},
    -- texlab = {},
    html = {},

    -- sumneko_lua = {
    --     Lua = {
    --         workspace = { checkThirdParty = false },
    --         telemetry = { enable = false },
    --     },
    -- },
}

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
})

local on_attach = function()
    require("lsp-conf")
    require("cmp-conf")
    require("diagnostic-conf")
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup_handlers({
    function(server_name)
        require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        })
    end,
})

-- Setup neovim lua configuration
require("neodev").setup()

-- Turn on lsp status information
require("fidget").setup({
    notification = {
        window = {
            winblend = 0,
        },
    },
})
