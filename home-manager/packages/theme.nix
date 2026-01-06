{pkgs, inputs, config, ...}:
{
  imports = [
    # ./catppuccin.nix
  ];

  home.packages = with pkgs; [
    # libsForQt5.qtstyleplugin-kvantum
    # libsForQt5.qt5ct
    # qt6Packages.qt6ct
    # qt6Packages.qtstyleplugin-kvantum
  ];

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Tokyonight-Dark";
    style.package = pkgs.tokyonight-gtk-theme;
  };

  gtk = {
    enable = true;
    # iconTheme.package = pkgs.nordzy-icon-theme;
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";

    theme.package = pkgs.tokyonight-gtk-theme;
    theme.name = "Tokyonight-Dark";
  };

  home.sessionVariables = {
    # QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
