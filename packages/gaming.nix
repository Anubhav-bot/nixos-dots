{config, pkgs, inputs, ...}:
{
  environment.systemPackages = with pkgs; [
    lutris
    antimicrox
  ];
  hardware.uinput.enable = true; # needed by antimicrox
}
