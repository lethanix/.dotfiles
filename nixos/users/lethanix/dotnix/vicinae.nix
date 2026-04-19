{ pkgs, ... }:

programs.vicinae = {
  enable = true;
  
  systemd = {
    enable = true;
    autoStart = true; # default: false
    environment = {
      USE_LAYER_SHELL = 1;
    };
  };
  
  settings = {
    close_on_focus_loss = true;
    consider_preedit = true;
    pop_to_root_on_close = true;
    favicon_service = "twenty";
    search_files_in_root = true;
    font = {
      normal = {
        size = 12;
        normal = "JetBrainsMono Nerd Font";
      };
    };
    theme = {
      light = {
        name = "catppuccin-latte";t
        icon_theme = "default";
      };
      dark = {
        name = "catppuccin-mocha";
        icon_theme = "default";
      };
    };
    launcher_window = {
      opacity = 0.98;
    };
  };
  
  extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
     bluetooth
     nix
     power-profile
  ];
};
