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
      self.packages.${pkgs.stdenv.hostPlatform.system}.cursor-themes
    ];

    gtk.cursorTheme = {
      name = "YeShunguang";
      size = 24;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.cursor-themes;
    };

    home.activation.cursorThemesSymlink = lib.hm.dag.entryAfter ["writeBoundary"] ''
      SOURCE_DIR="${self.packages.${pkgs.stdenv.hostPlatform.system}.cursor-themes}/share/icons"
      TARGET_DIR="/home/alice/.local/share/icons"

      mkdir -p "$TARGET_DIR"

      for cursor_dir in "$SOURCE_DIR"/*; do
        if [ -d "$cursor_dir" ]; then
          cursor_name=$(basename "$cursor_dir")
          TARGET="$TARGET_DIR/$cursor_name"

          if [ -d "$TARGET" ] && [ ! -L "$TARGET" ]; then
            echo "cursor-themes safety lock: $TARGET already exists as a physical directory. Skipping symlink creation."
          elif [ -L "$TARGET" ]; then
            rm -f "$TARGET"
            ln -s "$cursor_dir" "$TARGET"
          else
            ln -s "$cursor_dir" "$TARGET"
          fi
        fi
      done
    '';

    home.sessionVariables = {
      XCURSOR_THEME = "YeShunguang";
      XCURSOR_SIZE = "24";
    };

    xresources.properties = {
      "Xcursor.theme" = "YeShunguang";
      "Xcursor.size" = "24";
    };
  };
}
