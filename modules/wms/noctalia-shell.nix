{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.wms.noctalia-shell;
in
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  options.my.wms.noctalia-shell = {
    enable = lib.mkEnableOption "the Noctalia shell";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      services.noctalia-shell.enable = true;
    })
    {
      environment.systemPackages = with pkgs; [
        noctalia-shell
      ];
    }
  ];
}
