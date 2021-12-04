
local cmd = vim.cmd
local g = vim.g

-- Use <Tab> and <S-Tab> to navigate through popup menu
cmd 'inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"'
cmd 'inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"'

cmd 'imap <Tab> <Plug>(completion_smart_tab)'
cmd 'imap <S-Tab> <Plug>(completion_smart_s_tab)'

-- Set completeopt to have a better completion experience
--cmd 'set completeopt=menuone,noinsert,noselect'
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
cmd 'set shortmess+=c'
--cmd 'set completeopt-=preview'

g.completion_enable_auto_popup = 1
g.completion_enable_auto_hover = 1
g.completion_enable_auto_signature = 1

-- Matching Strategy
g.completion_matching_strategy_list = {'fuzzy'}

-- Trigger keyword length
g.completion_trigger_keyword_length = 1
