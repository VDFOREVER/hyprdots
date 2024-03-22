{ pkgs, config, ...}: 
{
  home.packages = with pkgs; [
    foot
    swaybg
    wofi
    jq
    waybar
    cinnamon.nemo
    pavucontrol
    hyprland
    grim
    obs-studio
    dunst
    hyprshade
    grimblast
    swappy
    wl-clipboard
    gnome.adwaita-icon-theme
  ];
}