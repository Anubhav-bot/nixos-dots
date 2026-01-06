{pkgs, inputs, ...}: {

  imports = [
    ./git.nix
    ./theme.nix
    ./viber.nix
  ];

  home.packages = with pkgs; [
    # uwufetch
    #
    vesktop
    python314Packages.uv
    spotify
    waytrogen
    swww
    rofi
    megasync
    alacritty
    sway
    onlyoffice-desktopeditors
    libnotify
    dunst
    clang
    lazygit
    obsidian
    vscode
    aria2
    waybar
    google-chrome
    mpv
    neovim
    kdePackages.kdeconnect-kde
    yazi
    zoxide
    starship
    btop
    tmux
    imv
    vicinae
    lutris
    umu-launcher
    scrcpy
    gnirehtet
    nodejs
    gemini-cli-bin
    ripgrep
  ];

} 
