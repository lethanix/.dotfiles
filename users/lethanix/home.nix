{ config, pkgs, ... }: {
  imports = [
    ./hyprland.nix
    ./neovim.nix
    ./git.nix
    ./bash.nix
    ./tmux.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lethanix";
  home.homeDirectory = "/home/lethanix";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    alacritty
    nodejs
    rustc
    cargo
    gcc
    go

    git-crypt
    gnupg
    pinentry_qt

    # Utilities
    hyprpaper
    starship
    neovide
    ripgrep
    zoxide
    unzip
    bat
    exa

    # Install Nerd Fonts with a limited number of fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

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
    ".config/alacritty".source = ~/.dotnix/alacritty;

    # Neovim config folder
    ".config/nvim".recursive = true;
    ".config/nvim".source = ~/.dotnix/nvim;

    ".config/starship.toml".source = ~/.dotnix/starship.toml;
    # ".config/tmux.conf".source = ~/.dotnix/tmux.conf;
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lethanix/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
