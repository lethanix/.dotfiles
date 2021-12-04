local cmd = vim.cmd
local g = vim.g

cmd 'set shortmess+=c'
vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = false;
        ultisnips = true;
        luasnip = true;
    };
}

local map = vim.api.nvim_set_keymap
-- Using windwp/nvim-autopairs
map('i',  '<C-Space>', 'compe#complete()', {noremap=true,expr=true, silent=true})
map('i',  '<CR>', "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", {noremap=true,expr=true, silent=true})
map('i',  '<C-e>', "compe#close('<C-e>')", {noremap=true,expr=true, silent=true})
map('i',  '<C-f>', "compe#scroll({ 'delta': +4 })", {noremap=true,expr=true, silent=true})
map('i',  '<C-d>', "compe#scroll({ 'delta': -4 })", {noremap=true,expr=true, silent=true})

-- Following example will use Tab and S-Tab (shift+tab) 
-- to navigate completion menu and jump between vim-vsnip 
-- placeholders when possible
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        --return t "<S-Tab>"
        return t "<C-h>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-h>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-h>", "v:lua.s_tab_complete()", {expr = true})