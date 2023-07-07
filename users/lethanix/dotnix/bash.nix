{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . ~/.dotfiles/users/lethanix/dotany/bashrc
    '';
    # Direnv setup: configure bash to execute the direnv hook
    initExtra = ''eval "$(direnv hook bash)"'';
  };
}
