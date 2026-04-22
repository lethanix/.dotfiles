{ pkgs, ... } :
{
    programs.git = {
        enable = true;
	settings = { 
	  user.name = "lethanix";
          user.email = "me@lethanix.com";
	  credential."https://github.com".helper = "${pkgs.gh}/bin/gh auth git-credential";
	};
    };

}
