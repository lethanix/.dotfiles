local g = vim.g -- a table to access global variables

g.diminactive_use_colorcolumn = 1
g.diminactive_use_syntax = 1
g.diminactive_buftype_blacklist = {"-MINIMAP-",'nofile', 'nowrite', 'acwrite', 'quickfix', 'help'}

vim.cmd('hi ColorColumn ctermbg=1 guibg=#000000')
