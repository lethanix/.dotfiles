{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    escapeTime = 0;
    baseIndex = 1;

    keyMode = "vi";
    prefix = "C-a";
    plugins = with pkgs.tmuxPlugins; [
    ];
  };
}
