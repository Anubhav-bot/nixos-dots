{pkgs, system, inputs, ...}: {

  imports = [
    ./git.nix
    ./theme.nix
    ./viber.nix
    ./zen.nix

  ];

  home.packages = with pkgs; [
    # uwufetch
  ];

} 
