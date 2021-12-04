
require'nvim-treesitter.configs'.setup {
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
  }
}

