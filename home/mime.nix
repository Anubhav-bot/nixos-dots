{ ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "zen-beta.desktop" "firefox.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" "firefox.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" "firefox.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" "firefox.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" "firefox.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-beta.desktop" "firefox.desktop" ];

      "x-scheme-handler/viber" = [ "viber.desktop" ];
      "x-scheme-handler/postman" = [ "Postman.desktop" ];

      "application/pdf" = [ "org.pwmt.zathura.desktop" "zen-beta.desktop" "firefox.desktop" ];
      "inode/directory" = [ "pcmanfm.desktop" ];
      "video/mp4" = [ "umpv.desktop" ];
      "image/png" = [ "imv-dir.desktop" ];
      "image/jpeg" = [ "imv-dir.desktop" ];
    };
  };
}
