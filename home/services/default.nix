{ pkgs, ... }: {
  imports = [
    ./mpd.nix
    ./study-reminder.nix
  ];
}
