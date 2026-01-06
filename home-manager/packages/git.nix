{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "pubgplayer7014@gmail.com";
        name = "Anubhav-bot";
      };
    };
  };
}
