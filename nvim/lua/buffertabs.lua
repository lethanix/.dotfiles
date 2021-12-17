
local bl = require("bufferline")

-- Simplify the api to create mappings
local map = vim.api.nvim_set_keymap

map('n', ']b', '<cmd>BufferLineCycleNext<CR>', {noremap=true})
map('n', '[b', '<cmd>BufferLineCyclePrev<CR>', {noremap=true})

map('n', '<leader>]b', '<cmd>BufferLineMoveNext<CR>', {noremap=true})
map('n', '<leader>[b', '<cmd>BufferLineMovePrev<CR>', {noremap=true})

map('n', '<leader>sb', '<cmd>BufferLineSortByDirectory<CR>', {noremap=true})
map('n', 'gb', '<cmd>BufferLinePick<CR>', {noremap=true})
map('n', '<leader>]c', '<cmd>BufferLineCloseRight<CR>', {noremap=true})
map('n', '<leader>[c', '<cmd>BufferLineCloseLeft<CR>', {noremap=true})

map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', {noremap=true})
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', {noremap=true})
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', {noremap=true})
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', {noremap=true})
map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', {noremap=true})
map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', {noremap=true})
map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', {noremap=true})
map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', {noremap=true})
map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', {noremap=true})

bl.setup {
    options = {
        separator_style = "padded_slant",
        max_name_length = 15,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        numbers = function(opts)
            return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        tab_size = 10,
        enforce_regular_tabs = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict, _)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or "" )
                s = s .. n .. sym
            end
            return s
        end,
        offsets = { { text_align = "center" } },
    }
}
