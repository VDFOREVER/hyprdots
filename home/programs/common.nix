{ lib, pkgs, ...}: 
{
  home.packages = with pkgs; [
    # archives
    unzip

    # misc
    spotify
    telegram-desktop
    vesktop
    steam
    qtpass
    firefox
    obs-studio

    # IDE
    vscode
  ];
}