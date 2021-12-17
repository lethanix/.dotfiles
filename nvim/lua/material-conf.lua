
vim.g.material_style = "deep ocean"

require('material').setup({

     -- Overwrite highlights with your own
    custom_highlights = {
        TSComment =             { fg = '#43474d' },
        TSType =                { fg = '#a85ff1' },
        TSInclude =             { fg = '#a85ff1', style = 'italic' }, -- use, mod
        TSKeyword =             { fg = '#38c7bd', style = 'italic' }, -- pub, impl, static, const, struct, etc.
        TSKeywordFunction =     { fg = '#38c7bd', style = 'italic' }, -- fn
        TSFunction =            { fg = '#11B7D4' }, -- Name of the functions
        TSNamespace =           { fg = '#11B7D4' }, -- Name of the crates: std::time
        TSFuncMacro =           { fg = '#11B7D4' },
        TSConditional =         { fg = '#c7910c' },
        TSNumber =              { fg = '#d4770c' },
        TSVariable =            { fg = '#c62f52' },
        TSProperty =            { fg = '#c62f52' },
        TSField =               { fg = '#c62f52' },
        TSParameter =           { fg = '#c62f52' },
        TSParameterReference =  { fg = '#c62f52' },
        TSConstant =            { fg = '#E35535' },
        String =                { fg = '#00a884'},
    },

    custom_colors = {
        bg = '#111418',
    },

    contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
    borders = false, -- Enable borders between verticaly split windows

    popup_menu = "colorful", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

    italics = {
        comments = true, -- Enable italic comments
        keywords = true, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = false, -- Enable italic strings
        variables = false -- Enable italic variables
    },

    contrast_windows = { -- Specify which windows get the contrasted (darker) background
        "terminal", -- Darker terminal background
        "packer", -- Darker packer background
        "qf", -- Darker qf list background
    },

    text_contrast = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },

    disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = true -- Hide the end-of-buffer lines
    },

})

