{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.wms.hyde;
in
{
  options.my.wms.hyde = {
    enable = lib.mkEnableOption "the HYDE desktop environment";
  };

  config = lib.mkIf cfg.enable {
    # TODO: Add HYDE configuration
    # https://github.com/Hyde-project/hyde
  };
}
