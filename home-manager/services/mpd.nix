{ pkgs, config, inputs, ...}:
{
  services.mpd = {
    enable = true;
    musicDirectory = "$HOME/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';

    # Optional:
    # network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };

  services.mpd-mpris = {
    enable = true;
  };
}
