{ pkgs, ... }: {

  imports = [
    # ../shared/nvim/neovim.nix
    ../shared/git.nix
    ../shared/bash/bash.nix
    # ../shared/tmux/tmux.nix
  ];

  home = {
    stateVersion = "24.05";
    username = "lethani";
    homeDirectory = "/Users/lethani";
    packages = with pkgs; [
      # Using better bash (not macOS/Apple)
      # bash
      # direnv
      # bashInteractive

      # DevOps
      # kubectl => use asdf instead in order to avoid version conflicts with K8s API
      # k9s

      # Utilities
      ghostty-bin
      starship
      tealdeer
      ripgrep
      zoxide
      ffmpeg
      bottom
      rustup

      tmux
      glow
      bat
      eza
      fzf 
      fd
      gh

      # macOS
      # iina
      # luajitPackages.luarocks # For neovim to work with some plugins, e.g. Mason

      # For neovim to work with some plugins, e.g. Mason
      # lua
      # luajitPackages.luarocks

      nerd-fonts.fira-code 
      nerd-fonts.jetbrains-mono
      nerd-fonts.space-mono
      commit-mono
    ];
  };
  programs.home-manager.enable = true;

  # This is to ensure programs are using ~/.config rather than
  # /Users/<username>/Library/whatever
  xdg.enable = true;

  # This will setup the shell to use home-manager properly on startup
  # programs.bash.enable = true;

  # Dotfiles management
  home.file = {
    # Neovim config folder
    ".config/nvim".recursive = true;
    ".config/nvim".source = ../shared/nvim;

    # Ghostty config path
    ".config/ghostty".recursive = true;
    ".config/ghostty".source = ./dotany/ghostty;

    # Other config files
    ".config/aerospace/aerospace.toml".source = ./dotany/aerospace.toml;
    ".wezterm.lua".source = ./dotany/wezterm.lua;
    ".config/starship.toml".source = ../shared/starship.toml;
    ".tmux.conf".source = ../shared/tmux/tmux.conf;
    ".config/eza/theme.yml".recursive = true;
    ".config/eza/theme.yml".source = ./dotany/eza_tokyonight.yml;

    # Remote login message when opening a new terminal
    ".hushlogin".recursive = true;
    ".hushlogin".source = ./dotany/hushlogin;
  };
}