{pkgs, config, inputs, ...} :
{
  programs.niri = {
      enable = true;
      useNautilus = false;
  };
  environment.systemPackages = [
    xwayland-satellite
  ];
}
