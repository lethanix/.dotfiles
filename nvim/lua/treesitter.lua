-- **************************************
-- Treesitter config
-- **************************************
require'nvim-treesitter.install'.compilers = {"gcc"}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  --ignore_install = { "haskell" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
}
