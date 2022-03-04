local lspconfig = require('lspconfig')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- luasnip setup
local luasnip = require 'luasnip'
luasnip.snippets={all={}}

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            -- "symbol_text" or "text_symbol" show the name of item's kind.
            mode = 'symbol_text', -- "symbol" only symbol annotations
            -- prevent the popup from showing more than provided characters
            -- (e.g 50 will not show more than 50 characters)
            maxwidth = 50,

            -- The function below will be called before any actual modifications
            -- from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                -- ...
                return vim_item
            end
        })
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                --luasnip.expand_or_jump()
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                --luasnip.jump(-1)
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

-- Add Visual Studio Code Dark+ Theme Colors to the Menu
-- gray
vim.cmd [[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]]
-- blue
vim.cmd [[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]]
vim.cmd [[ highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6]]
-- light blue
vim.cmd [[ highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]]
vim.cmd [[ highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE]]
vim.cmd [[ highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE]]
-- pink
vim.cmd [[ highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]]
vim.cmd [[ highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0]]
-- front
vim.cmd [[ highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]]
vim.cmd [[ highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4]]
vim.cmd [[ highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4]]
