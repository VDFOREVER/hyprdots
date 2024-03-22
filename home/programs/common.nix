{ lib, pkgs, ...}: 
{
  home.packages = with pkgs; [
    # archives
    unzip

    # misc
    spotify
    telegram-desktop
    discord
    steam
    qtpass
    firefox
    
    # productivity
    obsidian

    # IDE
    vscode
  ];
}