{pkgs, ...}: {
  imports = [
    # ./gammastep.nix # disable when using noctalia-shell
    # ./vicinae.nix
    ./mpd.nix
    ./study-reminder.nix
  ];

  home.packages = with pkgs; [
  ];
} 
