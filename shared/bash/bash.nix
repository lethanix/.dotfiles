{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . ~/.dotfiles/shared/bash/bashrc
    '';
    # Direnv setup: configure bash to execute the direnv hook
    initExtra = ''
      eval "$(direnv hook bash)"
    '';
  };
}
