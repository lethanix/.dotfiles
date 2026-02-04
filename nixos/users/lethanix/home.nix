{ config, pkgs, ... }: {
  imports = [
    # ./dotnix/hyprland.nix
    ./dotnix/neovim.nix
    ./dotnix/git.nix
    ./dotnix/bash.nix
    ./dotnix/tmux.nix
  ];

  home.stateVersion = "25.11";

  home.username = "lethanix";
  home.homeDirectory = "/home/lethanix";

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  home.packages = with pkgs; [
    # Nix utilities
    nil
    nixpkgs-fmt

    # Others
    starship
    ghostty
    neovide
    ripgrep
    zoxide
    direnv
    unzip
    bat
    eza
    fzf
    fd

    # Needed for neovim
    gcc
    gnumake
    nodejs

    # Fonts 
    nerd-fonts.fira-code
    nerd-fonts.space-mono
    nerd-fonts.jetbrains-mono
  ];

  # Home Manager dotfiles management
  home.file = {
    ".config/nvim".recursive = true;
    ".config/nvim".source = ../../../shared/nvim;

    ".config/starship.toml".source = ../../../shared/starship.toml;
    ".tmux.conf".source = ../../../shared/tmux/tmux.conf;

    ".config/hypr".recursive = true;
    ".config/hypr".source = ./dotany/hypr;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
}
