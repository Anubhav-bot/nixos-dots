{ pkgs, inputs, config, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    adw-gtk3
    nwg-look
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "noctalia";
  };

  gtk = {
    enable = true;
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
    gtk4.theme = config.gtk.theme;

    colorScheme = "dark";
    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3";
  };

  home.pointerCursor = {
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    size = 24;

    hyprcursor.enable = true;
  };
}
