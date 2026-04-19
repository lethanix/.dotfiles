{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
	. ~/.dotfiles/shared/bash/bashrc

    # Yazi config
	function y() {
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
		command yazi "$@" --cwd-file="$tmp"
		IFS= read -r -d "" cwd < "$tmp"
		[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
		rm -f -- "$tmp"
	}
    '';
  };
}
