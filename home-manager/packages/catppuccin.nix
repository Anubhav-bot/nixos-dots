{pkgs, inputs, config, ...}:
{
  catppuccin = {
      enable = true;
      accent = "blue";
      flavor = "mocha";

      gtk = {
        icon = {
          enable = true;
          accent = "blue";
        };
      };

  };
}
