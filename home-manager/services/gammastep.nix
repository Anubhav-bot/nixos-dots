{ pkgs, config, inputs, ...}:
{
  services.gammastep = {
    enable = true;
    provider = "geoclue2";

    duskTime = "18:35-20:15";
    dawnTime = "6:00-7:45";

    temperature = {
      day = 5500;
      night = 3700;
    };

# Tray Icon
    tray = true;

    enableVerboseLogging = true;

    # settings = {
    #   general = {
    #     adjustment-method = "randr";
    #   };
    #   randr = {
    #     screen = 0;
    #   };
    # };
  };
}
