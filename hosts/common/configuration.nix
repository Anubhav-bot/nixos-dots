{ config, pkgs, inputs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = false;
  services.upower.enable = true;

  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.timothy = {
    isNormalUser = true;
    description = "timothy";
    extraGroups = [ "networkmanager" "wheel" "uinput" "input" ];
    useDefaultShell = true;
  };
  users.defaultUserShell = pkgs.fish;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = false;

  hardware.graphics.enable = true;

  programs.fish.enable = true;
  programs.auto-cpufreq.enable = true;
  programs.kdeconnect.enable = true;

  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {
      _7zz = pkgs._7zz-rar;
    };
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    libgcc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-mono
    nerd-fonts.fira-code
    ubuntu-sans
    texlivePackages.noto-emoji
  ];

  fonts.fontconfig.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.interception-tools = {
    enable = true;
    plugins = [ pkgs.interception-tools-plugins.caps2esc ];
    udevmonConfig = ''
      - JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };

  security.wrappers.btop = {
    enable = true;
    owner = "root";
    group = "root";
    source = "${pkgs.btop}/bin/btop";
    capabilities = "cap_perfmon=ep";
  };

  system.stateVersion = "25.11";
}
