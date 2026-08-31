{
  flake.homeModules.aliceXsettingsd = {pkgs, ...}: {
    xdg.configFile."xsettingsd/xsettingsd.conf".text = ''
      Gtk/CursorThemeName "YeShunguang"
      Gtk/CursorThemeSize 24
    '';
  };
}
