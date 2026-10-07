{...}: {
  flake.custom.system-modules.kobo-sway = {
    config,
    lib,
    ...
  }: let
    home = config.home.homeDirectory;
    mod = "Mod4";
  in {
    options.kobo.wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "${home}/Pictures/Wallpapers/wallpaper_name.png";
    };

    config = {
      wayland.windowManager.sway = {
        enable = true;
        package = null;
        checkConfig = false;
        systemd.enable = false;
        xwayland = true;
        config = {
          modifier = mod;
          terminal = "foot";
          menu = "wmenu-run";
          bars = [];
          output."*".bg = "${config.kobo.wallpaper} fill";
          keybindings = lib.mkOptionDefault {
            "${mod}+Shift+l" = "exec swaylock -f";
            "${mod}+Shift+e" = "exec swaymsg exit";
          };
        };
      };

      programs.swaylock = {
        enable = true;
        package = null;
        settings = {
          color = "1e1e2e";
          show-failed-attempts = true;
          ignore-empty-password = true;
        };
      };
    };
  };
}
