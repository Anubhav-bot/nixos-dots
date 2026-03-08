{pkgs, ...}: {
  imports = [
    # ./gammastep.nix # disable when using noctalia-shell
    # ./vicinae.nix
  ];

  home.packages = with pkgs; [
  ];
} 
