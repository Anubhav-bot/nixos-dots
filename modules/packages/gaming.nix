{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    lutris
    wl-clicker
    antimicrox
  ];

  hardware.uinput.enable = true;
}
