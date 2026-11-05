{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.gtk = {pkgs, ...}: {
    gtk = {
      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
      enable = true;
      gtk3.extraCss = ''
        @import url("shoji-colors.css");
        @import url("shoji.css");

        @define-color theme_bg_color @window_bg_color;
        @define-color theme_fg_color @window_fg_color;
        @define-color theme_base_color @view_bg_color;
        @define-color theme_text_color @view_fg_color;
        @define-color theme_selected_bg_color @accent_bg_color;
        @define-color theme_selected_fg_color @accent_fg_color;
      '';
      gtk4.extraCss = ''
        @import url("shoji-colors.css");
        @import url("shoji.css");

        @define-color theme_bg_color @window_bg_color;
        @define-color theme_fg_color @window_fg_color;
        @define-color theme_base_color @view_bg_color;
        @define-color theme_text_color @view_fg_color;
        @define-color theme_selected_bg_color @accent_bg_color;
        @define-color theme_selected_fg_color @accent_fg_color;
      '';
    };
    xdg.configFile."gtk-3.0/gtk.css".force = true;
    xdg.configFile."gtk-4.0/gtk.css".force = true;
  };
}
