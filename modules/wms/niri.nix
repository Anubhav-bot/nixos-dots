{ config, lib, pkgs, ... }:

let
  cfg = config.my.wms.niri;
in
{
  options.my.wms.niri = {
    enable = lib.mkEnableOption "the niri compositor";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      useNautilus = false;
    };

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
