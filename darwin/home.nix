{ pkgs, shared, ... }: {
  imports = [
    ../shared/nvim/neovim.nix
    #./dotnix/git.nix
    #./dotnix/bash.nix
    #./dotnix/tmux.nix
  ];
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "lethani";
    homeDirectory = "/Users/lethani";
    packages = with pkgs; [ 
   	ripgrep
	fd
	(nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
    ];
  };
  programs.home-manager.enable = true;

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
    # ".config/alacritty".recursive = true;
    # ".config/alacritty".source = ./dotany/alacritty;
 
    # Neovim config folder
    ".config/nvim".recursive = true;
    ".config/nvim".source = ../shared/nvim;

    # ".config/starship.toml".source = ./dotany/starship.toml;
    # ".config/tmux.conf".source = ./dotany/tmux.conf;
  };
}
