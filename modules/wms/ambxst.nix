{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.wms.ambxst;
in
{
  options.my.wms.ambxst = {
    enable = lib.mkEnableOption "the Ambxst shell";
  };

  config = lib.mkIf cfg.enable {
    # TODO: Add Ambxst configuration
  };
}
