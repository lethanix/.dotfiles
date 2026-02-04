{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
	. ~/.dotfiles/shared/bash/bashrc
    '';
  };
}
