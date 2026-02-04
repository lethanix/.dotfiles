{ pkgs, ... } :
{
    programs.git = {
        enable = true;
        settings = {
            user.name = "lethanix";
            user.email = "me@lethanix.com";
        };
    };

}
