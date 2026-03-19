{}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "zen.desktop", "firefox.desktop" ];
      "application/x-extension-htm" = [ "zen.desktop", "firefox.desktop" ];
      "application/x-extension-html" = [ "zen.desktop", "firefox.desktop" ];
      "x-scheme-handler/http" = [ "zen.desktop", "firefox.desktop" ];
      "x-scheme-handler/https" = [ "zen.desktop", "firefox.desktop" ];
      "x-scheme-handler/about" = [ "zen.desktop", "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "zen.desktop", "firefox.desktop" ];

      "x-scheme-handler/viber" = "viber.desktop";
      "x-scheme-handler/postman" = "Postman.desktop";

      "application/pdf" = "org.pwmt.zathura.desktop"
        "inode/directory" = "pcmanfm.desktop";
      "video/mp4" = "mpv.desktop";
      "image/png" = "imv-dir.desktop";
      "image/jpeg" = "imv-dir.desktop";
    };

  };
}
