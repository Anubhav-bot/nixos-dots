{pkgs, config, inputs, ...} :
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  services.noctalia-shell.enable = true;

#needed when option is not enabled
  # environment.systemPackages = with pkgs; [
  #   noctalia-shell
  # ];
}
