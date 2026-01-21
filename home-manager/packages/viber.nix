{ pkgs, config, ... }:

{
  xdg.configFile."fontconfig/viber/fonts.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <include>/etc/fonts/fonts.conf</include>
      <include>conf.d</include>
    </fontconfig>
  '';

  xdg.configFile."fontconfig/viber/conf.d/99-reject-noto-color-emoji.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <selectfont>
        <rejectfont>
          <pattern>
            <patelt name="family">
              <string>Noto Color Emoji</string>
            </patelt>
          </pattern>
        </rejectfont>
      </selectfont>
    </fontconfig>
  '';

  home.packages = [
    (pkgs.viber.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        wrapProgram $out/bin/viber \
          --set FONTCONFIG_PATH "${config.xdg.configHome}/fontconfig/viber"
      '';
    }))
  ];

  xdg.desktopEntries.viber = {
    name = "Viber";
    exec = ''
      env FONTCONFIG_PATH=${config.xdg.configHome}/fontconfig/viber viber %U
      '';
    icon = "viber";
    terminal = false;
    categories = [ "Network" "InstantMessaging" ];
  };
}
