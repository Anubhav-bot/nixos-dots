{config, pkgs, inputs, ...}:
{
  environment.systemPackages = [
    lutris
    antimicrox
  ];
  hardware.uinput.enable = true; # needed by antimicrox
}
