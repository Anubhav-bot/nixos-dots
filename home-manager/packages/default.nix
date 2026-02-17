{pkgs, inputs, ...}: {

  imports = [
    ./git.nix
    ./theme.nix
    ./viber.nix
  ];

  home.packages = with pkgs; [
    # uwufetch
  ];

} 
