{pkgs, config, inputs, ...} :
{
  imports = [
    ./noctalia-shell.nix
    ./niri.nix
    # ./hyprland.nix
  ];

  environment.systemPackages = with pkgs; [
    # dunst
    # gammastep # if noctalia-shell then disable home-manager/services/default -> ./gammastep.nix 
  ];
}
