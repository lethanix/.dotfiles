{ pkgs, ... }: {

  imports = [
    ../shared/nvim/neovim.nix
    ../shared/git.nix
    ../shared/bash/bash.nix
    ../shared/tmux/tmux.nix
  ];

  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "lethani";
    homeDirectory = "/Users/lethani";
    packages = with pkgs; [
      alacritty
      nodejs
      rustc
      cargo
      gnumake
      cmake
      go
      gh

      # Utilities
      starship
      tealdeer
      ripgrep
      zoxide
      ffmpeg
      direnv
      unzip
      bashInteractive
      glow
      bat
      eza
      fd

      # macOS
      iina
      luajitPackages.luarocks # For neovim to work with some plugins, e.g. Mason

      # For neovim to work with some plugins, e.g. Mason
      lua
      luajitPackages.luarocks

      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "SpaceMono" ]; })
    ];
  };
  programs.home-manager.enable = true;

  # This is to ensure programs are using ~/.config rather than
  # /Users/<username>/Library/whatever
  xdg.enable = true;

  # I use fish, but bash and zsh work just as well here. This will setup
  # the shell to use home-manager properly on startup, neat!
  programs.bash.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # Alacritty config folder from GitHub repository
    ".config/alacritty".recursive = true;
    ".config/alacritty".source = ../shared/alacritty;

    # Neovim config folder
    ".config/nvim".recursive = true;
    ".config/nvim".source = ../shared/nvim;

    # Other config files
    ".config/aerospace/aerospace.toml".source = ./dotany/aerospace.toml;
    ".wezterm.lua".source = ./dotany/wezterm.lua;
    ".config/starship.toml".source = ../shared/starship.toml;
    ".config/tmux.conf".source = ../shared/tmux/tmux.conf;
    ".config/eza/theme.yml".recursive = true;
    ".config/eza/theme.yml".source = ./dotany/eza_tokyonight.yml;

    # Remote login message when opening a new terminal
    ".hushlogin".recursive = true;
    ".hushlogin".source = ./dotany/hushlogin;
  };
}
