-- **************************************
-- Treesitter config
-- **************************************
require'nvim-treesitter.install'.compilers = {"gcc"}
require'nvim-treesitter.configs'.setup {
    ensure_installed = {},
    --ignore_install = { "haskell" }, -- List of parsers to ignore installing
    highlight = { enable = true, }, -- false will disable the whole extension
    indent = { enable = true, },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            -- node_decremental = '<c-backspace>',
            node_decremental = '<c-l>',
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
    rainbow = {
	enable = true,
	extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
	max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	colors = {
	    "#D39E17",--"#cc241d",
	    "#A15DEF",--#a89984",
	    "#3398DB",--"#b16286",
	    --"#d79921",
	    --"#689d6a",
	    --"#d65d0e",
	    --"#458588"
	}
    },
}
