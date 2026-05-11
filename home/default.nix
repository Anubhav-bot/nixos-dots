{
  imports = [
    ./packages/default.nix
    ./services/default.nix
    ./mime.nix
  ];

  home.username = "timothy";
  home.homeDirectory = "/home/timothy";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
