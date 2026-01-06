{ pkgs, inputs, ...}: {
  # WHY DOES THIS NOT WORKRKEKJKRJRJ:SLRJIJREJ

  imports = [
    inputs.ax-shell.homeManagerModules.default
  ];

  programs.ax-shell = {
    enable = true;
    settings = {
      # --- General ---
      terminalCommand = "kitty -e";
      wallpapersDir = "~/Pictures";

      # --- Cursor ---
      cursor = {
        package = pkgs.oreo-cursors-plus;
        name = "oreo_black_cursors";
        size = 24;
      };

      # --- Bar & Dock ---
      bar = {
        position = "Top"; # "Top", "Bottom", "Left", "Right"
        theme = "Pills";  # "Pills", "Dense", "Edge"
      };
      dock.enable = false; # Disable the dock
      panel.theme = "Notch"; # "Notch", "Panel"

      # --- Keybindings ---
      keybindings.launcher = { prefix = "SUPER"; suffix = "SPACE"; };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # ... your other Hyprland settings (monitors, animations, etc.)

      # --- Ax-Shell Integration ---
      # Use the '++' operator to merge Ax-Shell's binds with your own.
      bind = config.programs.ax-shell.hyprlandBinds ++ [
        # Add your custom keybinds here
        "SUPER, return, exec, kitty"
        "SUPER, Q, killactive,"
      ];

      # Merge Ax-Shell's startup commands with your own.
      exec-once = config.programs.ax-shell.hyprlandExecOnce ++ [
        # Your other startup apps
      ];
    };
  };


}
