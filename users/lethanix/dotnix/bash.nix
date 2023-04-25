{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . ~/.dotfiles/users/lethanix/dotany/bashrc
    '';
  };
}
