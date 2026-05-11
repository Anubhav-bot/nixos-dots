{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.my.wms.hyprland;
in
{
  options.my.wms.hyprland = {
    enable = lib.mkEnableOption "the Hyprland compositor";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
