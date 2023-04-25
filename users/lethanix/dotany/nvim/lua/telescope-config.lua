-- Enable telescope fzf native, if installedcong
pcall(require('telescope').load_extension, 'fzf')

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
map('n', '<leader>pd', [[<Cmd>lua require('telescope.builtin').diagnostics()<cr>]], options)
map('n', '<leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<cr>]], options)
map('n', '<leader>pg', [[<Cmd>lua require('telescope.builtin').live_grep()<cr>]], options)
map('n', '<leader>pb', [[<Cmd>lua require('telescope.builtin').buffers()<cr>]], options)
map('n', '<leader>ph', [[<Cmd>lua require('telescope.builtin').help_tags()<cr>]], options)
-- map('n', '<leader>tf', [[<Cmd>lua require('telescope.builtin').file_browser()<cr>]], options)

-- Git
map('n', '<leader>gs', [[<Cmd>lua require('telescope.builtin').git_status()<cr>]], options)

-- TODO: Create additional configuration using Telescope
-- You can pass additional configuration to telescope to change theme, layout, etc.
map('n', '<leader>/',
	[[<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find( require('telescope.themes').get_dropdown{ winblend = 10, previewer = false, })<cr>]]
	, options)

require('telescope').setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = ' ',
		selection_caret = ' ',
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
				preview_width = 0.6
			},
			vertical = {
				mirror = false,
			},
			flex = {
				mirror = false,
				preview_width = 0.6
			},
		},
		file_sorter = require('telescope.sorters').get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
		mappings = { n = { ['¡'] = require('telescope.actions').close } }
	},
	pickers = {
		find_files = { theme = 'dropdown', },
		buffers = { theme = 'dropdown', },
	},
}
