{
  flake.homeModules.aliceXsettingsd = {pkgs, ...}: {
    xdg.configFile."xsettingsd/xsettingsd.conf".text = ''
      Gtk/CursorThemeName "AriaCursor"
      Gtk/CursorThemeSize 24
    '';
  };
}
