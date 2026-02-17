{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        pkgs.pango
        pkgs.gtk4
        pkgs.libadwaita
      ];
      extraLibraries = pkgs: with pkgs; [
        libadwaita
        gtk4
      ];
    })
    wl-clicker # For autoclicking and things

    antimicrox
  ];

  hardware.uinput.enable = true; # needed by antimicrox
}
