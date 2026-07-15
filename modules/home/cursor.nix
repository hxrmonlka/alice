{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.cursorSettings = {
    pkgs,
    lib,
    ...
  }: {
    home.packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.aria-cursor
    ];

    gtk.cursorTheme = {
      name = "AriaCursor";
      size = 24;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.aria-cursor;
    };

    home.activation.ariaCursorSymlink = lib.hm.dag.entryAfter ["writeBoundary"] ''
      TARGET="/home/alice/.local/share/icons/AriaCursor"
      SOURCE="${self.packages.${pkgs.stdenv.hostPlatform.system}.aria-cursor}/share/icons/AriaCursor"

      if [ -d "$TARGET" ] && [ ! -L "$TARGET" ]; then
        echo "aria-cursor safety lock: $TARGET already exists as a physical directory. Skipping symlink creation."
      elif [ -L "$TARGET" ]; then
        rm -f "$TARGET"
        ln -s "$SOURCE" "$TARGET"
      else
        mkdir -p "$(dirname "$TARGET")"
        ln -s "$SOURCE" "$TARGET"
      fi
    '';

    home.sessionVariables = {
      XCURSOR_THEME = "AriaCursor";
      XCURSOR_SIZE = "24";
    };

    xresources.properties = {
      "Xcursor.theme" = "AriaCursor";
      "Xcursor.size" = "24";
    };
  };
}
