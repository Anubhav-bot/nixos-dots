{
  imports = [
    ./packages.nix
  ];
  
  home.username = "timothy";
  home.homeDirectory = "/home/timothy";
  home.stateVersion = "25.11";

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  programs.home-manager.enable = true;
}
