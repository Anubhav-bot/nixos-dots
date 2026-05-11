{ pkgs, config, inputs, ... }:

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

    network.startWhenNeeded = true;
  };

  services.mpd-mpris = {
    enable = true;
  };
}
