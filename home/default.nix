{ config, pkgs, ... }:
{
    imports = [
        ./programs
    ];

    home = {
        username = "vdforever";
        homeDirectory = "/home/vdforever";
        stateVersion = "24.05";
    };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}