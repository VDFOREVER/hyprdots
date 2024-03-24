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
    dunst
    hyprshade
    grimblast
    swappy
    wl-clipboard
    xdg-utils
    xdg-desktop-portal-hyprland 
    dconf
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;t
      name = "Flat-Remix-GTK-Grey-Dark";
    };

    cursorTheme = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors-light";
      size = 24;
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-grey";
    };
  };
}