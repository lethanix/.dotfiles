{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    terminal = "tmux-256color";
    extraConfig = ''
    set-option -ga terminal-overrides ",*:RGB"
    set -g @catppuccin_flavour 'mocha'
    '';

    escapeTime = 0;
    baseIndex = 1;

    keyMode = "vi";
    prefix = "C-a";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
  };
}
