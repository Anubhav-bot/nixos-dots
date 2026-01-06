{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    (pkgs.viber.overrideAttrs (old: rec {
          postInstall = ''
            wrapProgram $out/bin/viber \
              --prefix FONTCONFIG_FILE : ${pkgs.writeText "viber-fonts.conf" ''
                <?xml version="1.0"?>
                <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
                <fontconfig>
                  <include ignore_missing="yes">${pkgs.fontconfig}/etc/fonts/fonts.conf</include>
                  <selectfont>
                    <rejectfont>
                      <pattern>
                        <patelt name="family"><string>Noto Color Emoji</string></patelt>
                      </pattern>
                    </rejectfont>
                  </selectfont>
                </fontconfig>
            ''}
          '';
    }))
  ];
}
