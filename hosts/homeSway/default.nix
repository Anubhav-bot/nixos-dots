{ ... }: {
  imports = [
    ../common/configuration.nix
    ../home/hardware-configuration.nix
  ];

  my.wms.sway.enable = true;
}
