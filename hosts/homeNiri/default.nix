{ ... }: {
  imports = [
    ../common/configuration.nix
    ../home/hardware-configuration.nix
  ];

  my.wms.niri.enable = true;
}
