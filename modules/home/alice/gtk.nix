{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.gtk = {
    pkgs,
    lib,
    ...
  }: {
    gtk.enable = true;
    gtk.gtk3.extraCss = ''
      @import url("dank-colors.css");
      @import url("thunar-colors.css");

      @define-color theme_bg_color @window_bg_color;
      @define-color theme_fg_color @window_fg_color;
      @define-color theme_base_color @view_bg_color;
      @define-color theme_text_color @view_fg_color;
      @define-color theme_selected_bg_color @accent_bg_color;
      @define-color theme_selected_fg_color @accent_fg_color;

      menu,
      popover.background {
        background-color: @popover_bg_color;
        color: @popover_fg_color;
      }

      .thunar {
        background-color: @thunar_surface;
        color: @thunar_on_surface;
      }

      .thunar treeview.view {
        background-color: @thunar_surface_container;
        color: @thunar_on_surface;
      }

      .thunar treeview.view row:selected {
        background-color: @thunar_secondary_container;
        color: @thunar_on_secondary_container;
        border-radius: 12px;
      }

      .thunar .standard-view .view {
        background-color: @thunar_surface;
        color: @thunar_on_surface;
      }

      .thunar .standard-view .view:selected,
      .thunar .standard-view .view:selected:focus {
        background-color: @thunar_secondary_container;
        color: @thunar_on_secondary_container;
        border-radius: 16px;
      }

      .thunar toolbar,
      .thunar headerbar {
        background-color: @thunar_surface_container_high;
        color: @thunar_on_surface;
        border-bottom: 1px solid @thunar_outline_variant;
        padding: 4px;
      }

      .thunar entry {
        background-color: @thunar_surface_container_highest;
        color: @thunar_on_surface;
        border: 1px solid @thunar_outline;
        border-radius: 20px;
        padding: 4px 12px;
      }

      .thunar entry:focus-within {
        border-color: @thunar_primary;
      }

      .thunar toolbar button,
      .thunar headerbar button {
        color: @thunar_on_surface;
        border-radius: 999px;
        min-width: 28px;
        min-height: 28px;
      }

      .thunar toolbar button image,
      .thunar headerbar button image {
        color: @thunar_on_surface;
        -gtk-icon-style: symbolic;
      }

      .thunar toolbar button:hover,
      .thunar headerbar button:hover {
        background-color: alpha(@thunar_on_surface, 0.08);
      }

      .thunar toolbar button:active,
      .thunar toolbar button:checked,
      .thunar headerbar button:active,
      .thunar headerbar button:checked {
        background-color: @thunar_secondary_container;
        color: @thunar_on_secondary_container;
      }

      .thunar notebook header {
        background-color: @thunar_surface_container_high;
        border-bottom: 1px solid @thunar_outline_variant;
        padding: 0 4px;
      }

      .thunar notebook header tab {
        background-color: transparent;
        color: @thunar_on_surface_variant;
        padding: 6px 14px;
      }

      .thunar notebook header tab:checked {
        background-color: @thunar_surface;
        color: @thunar_on_surface;
        box-shadow: inset 0 -2px @thunar_primary;
      }

      .thunar notebook header tab:hover {
        background-color: alpha(@thunar_on_surface, 0.08);
      }

      .thunar infobar {
        background-color: @thunar_surface_container_high;
        border-top: 1px solid @thunar_outline_variant;
        padding: 8px;
      }

      .thunar infobar button {
        background-color: @thunar_surface_container_highest;
        color: @thunar_on_surface;
        border: 1px solid @thunar_outline;
        border-radius: 20px;
        padding: 4px 16px;
      }

      .thunar infobar button:hover {
        background-color: alpha(@thunar_on_surface, 0.08);
      }

      .thunar statusbar {
        background-color: @thunar_surface_container;
        color: @thunar_on_surface_variant;
        border-top: 1px solid @thunar_outline_variant;
      }

      .thunar paned > separator {
        background-color: @thunar_outline_variant;
        min-width: 1px;
      }
    '';
    gtk.gtk4.extraCss = ''
      @import url("dank-colors.css");

      @define-color theme_bg_color @window_bg_color;
      @define-color theme_fg_color @window_fg_color;
      @define-color theme_base_color @view_bg_color;
      @define-color theme_text_color @view_fg_color;
      @define-color theme_selected_bg_color @accent_bg_color;
      @define-color theme_selected_fg_color @accent_fg_color;
    '';
    xdg.configFile."gtk-3.0/gtk.css".force = true;
    xdg.configFile."gtk-4.0/gtk.css".force = true;
  };
}
