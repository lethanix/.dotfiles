-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    gopls = {},
    pyright = {},
    rust_analyzer = {},
    zls = {},
    bashls = {},
    julials = {},
    texlab = {},
    html = {},

    sumneko_lua = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- on_new_config = function(config, root_dir)
--     local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
--     if string.len(env) > 0 then
--       config.settings.python.pythonPath = env .. '/bin/python'
--     end
--   end

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

local on_attach = function()
    require('lsp-conf')
    require('cmp-conf')
    require('diagnostic-conf')
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}
-- require("lspconfig").pyright.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
--     on_new_config = function(config, root_dir)
--         local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
--         if string.len(env) > 0 then
--             config.settings.python.pythonPath = env .. '/bin/python'
--         end
--     end
-- }

-- Setup neovim lua configuration
require('neodev').setup()

-- Turn on lsp status information
require('fidget').setup()
