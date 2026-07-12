{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceCore = {pkgs, ...}: {
    home.username = "alice";
    home.homeDirectory = "/home/alice";

    home.stateVersion = "26.05";

    gtk.cursorTheme = {
      name = "AriaCursor";
      size = 24;
    };

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
