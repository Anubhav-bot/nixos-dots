{pkgs, ...}: {
  imports = [
    ./gammastep.nix
    ./vicinae.nix
  ];

  home.packages = with pkgs; [
  ];
} 
