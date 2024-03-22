{ pkgs, ... }: 
{
    home.packages = [pkgs.gh];

    programs.git = {
        enable = true;

        userName = "VDFOREVER";
        userEmail = "vdforever@proton.me";
    };
}