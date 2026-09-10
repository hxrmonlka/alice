{
  flake.custom.alice.xsettingsd = {pkgs, ...}: {
    xdg.configFile."xsettingsd/xsettingsd.conf".text = ''
      Gtk/CursorThemeName "YeShunguang"
      Gtk/CursorThemeSize 24
    '';
  };
}
