{ pkgs, config, inputs, ... }:

{
  imports = [
    ./gaming.nix
  ];

  programs.gpu-screen-recorder.enable = true;

  environment.systemPackages = with pkgs; [
    # System utilities
    vim
    git
    nix-search-cli
    home-manager
    nh
    interception-tools
    tealdeer
    interception-tools-plugins.caps2esc
    wl-clipboard
    brightnessctl
    fzf
    playerctl
    btop
    font-manager
    firefox
    kitty

    # Dev tools
    opencode
    lsof
    clang
    lazygit
    ripgrep
    neovim
    tmux
    zoxide
    starship
    nodejs
    python314Packages.uv

    # GUI apps
    vesktop
    spotify
    obsidian
    vscode
    google-chrome
    onlyoffice-desktopeditors
    postman
    pcmanfm
    alacritty

    # Screenshot/media
    grim
    swappy
    slurp
    swww
    mpv
    imv

    # Launcher/WM
    rofi
    waybar
    waytrogen

    # FHS compat
    antigravity-fhs
    code-cursor-fhs
    zed-editor-fhs

    # Utilities
    aria2
    yt-dlp
    vicinae
    libnotify
    cmatrix
    gpu-screen-recorder-gtk

    # Android
    scrcpy
    android-tools
    gnirehtet

    # Other
    gemini-cli-bin
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    umu-launcher
  ];
}
