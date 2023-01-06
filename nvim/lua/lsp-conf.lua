-- LSP keymaps
-- Aux function to easily define mappings
local nmap = function(keys, func, desc)
    if desc then
        desc = 'LSP: ' .. desc
    end
    local opts = { buffer = true, desc = desc }

    vim.keymap.set('n', keys, func, opts)
end

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<C-k', vim.lsp.buf.signature_help, 'Signature Documentation')

nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- Format file commands and keymaps
vim.api.nvim_buf_create_user_command(0, "Format", function()
    vim.lsp.buf.format {
        async = true,
        filter = function(client) return client.name ~= "pyright" end
    }
end, { desc = 'Format current buffer with LSP' })

vim.keymap.set('n', '<leader>df', function()
    vim.lsp.buf.format { async = true }
end)
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format { async=true }]]

-- Use LSP as the handler for formatexpr.
--    See `:help formatexpr` for more information.
vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
