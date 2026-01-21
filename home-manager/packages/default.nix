{pkgs, inputs, ...}: {

  imports = [
    ./git.nix
    # ./theme.nix #not needed if using noctalia-shell
    ./viber.nix
  ];

  home.packages = with pkgs; [
    # uwufetch
  ];

} 
