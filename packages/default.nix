{pkgs, config, inputs, ...} :
{
  imports = [
    ./gaming.nix
  ];

  programs.gpu-screen-recorder.enable = true;

  environment.systemPackages = with pkgs; [
    icu ##test
    vesktop
    gpu-screen-recorder-gtk
    appimage-run
    python314Packages.uv
    grim
    swappy
    slurp
    spotify
    waytrogen
    swww
    rofi

    antigravity-fhs
    code-cursor-fhs
    zed-editor-fhs

    opencode
    lsof

    alacritty
    onlyoffice-desktopeditors
    libnotify
    clang
    lazygit
    obsidian
    vscode
    pcmanfm
    cmatrix
    postman
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    aria2
    yt-dlp
    waybar
    google-chrome
    mpv
    neovim
    zoxide
    starship
    tmux
    imv
    vicinae
    # kdePackages.kdenlive
    umu-launcher
    scrcpy
    android-tools
    gnirehtet
    nodejs
    gemini-cli-bin
    ripgrep
  ];
}
