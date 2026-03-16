{pkgs, config, inputs, ...} :
{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  services.noctalia-shell.enable = false;

#needed when option is not enabled
  environment.systemPackages = with pkgs; [
    noctalia-shell
  ];
}
