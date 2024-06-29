{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      packer-nvim
      undotree

      # Color schemes
      catppuccin-nvim
      material-nvim
      tokyonight-nvim
      kanagawa-nvim

      # Status line
      nvim-web-devicons
      lualine-nvim

      # Utilities
      comment-nvim # "gc" to comment visual regions/lines
      indent-blankline-nvim # Adds indentation guides to all lines
      alpha-nvim # Dashboard/greeter
      better-escape-nvim # Escape using jk/jj
      gitsigns-nvim
      vim-sleuth # Detect tabstop and shiftwidth automatically

      # Fuzzy Finder (files, lsp, etc)
      telescope-nvim
      telescope-fzf-native-nvim

      # Treesitter
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects

      # LSP
      lspkind-nvim # Adds vscode-like pictograms to neovim lsp
      lsp_extensions-nvim
      mason-nvim
      mason-lspconfig-nvim
      fidget-nvim
      neodev-nvim
      nvim-lspconfig
      # null-ls-nvim

      # Autocompletion
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-cmdline
      cmp_luasnip
      luasnip

      nvim-autopairs
      nvim-colorizer-lua # Show colors
    ];
  };
}
