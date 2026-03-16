{pkgs, ...}: {
  imports = [
    # ./gammastep.nix # disable when using noctalia-shell
    # ./vicinae.nix
    ./mpd.nix
  ];

  home.packages = with pkgs; [
  ];
} 
