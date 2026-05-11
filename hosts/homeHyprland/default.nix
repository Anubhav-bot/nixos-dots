{ ... }: {
  imports = [
    ../common/configuration.nix
    ../home/hardware-configuration.nix
  ];

  my.wms.hyprland.enable = true;
}
