-- Icons to display according to vim.fn.mode
local nerd_icons = {
    n = "",
    i = "",
    v = "",
    c = " ",
    [''] = " ",
    V = " ",
    no = "",
    R = "",
}
require('lualine').setup { options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '',
    -- component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
},

    sections = {
        lualine_a = { {
            'mode',
            fmt = function() return nerd_icons[vim.fn.mode()] end,
            separator = { left = '' },
            right_padding = 0,
            left_padding = 0,
        },
        },
        lualine_b = {
            'filename',
            { 'filetype', icon_only = true }
        },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = {},
        lualine_y = { {
            'progress',
            right_padding = 0,
            left_padding = 0,
        } },
        lualine_z = { {
            'fileformat',
            symbols = {
                unix = '', -- fedora '' '',
                -- dos = '', -- e70f
                -- mac = '', -- e711
            },
            separator = { right = '' },
        } },
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {
        -- lualine_a = {},
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = { { 'tabs', mode = 1 } },
    },
    extensions = {}
}
