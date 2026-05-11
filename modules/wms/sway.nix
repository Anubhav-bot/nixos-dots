{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.wms.sway;
in
{
  options.my.wms.sway = {
    enable = lib.mkEnableOption "the Sway compositor";
  };

  config = lib.mkIf cfg.enable {
    programs.sway = {
      enable = true;
    };
  };
}
