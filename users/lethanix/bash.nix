{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      . ~/.dotnix/bashrc
    '';
  };
}
