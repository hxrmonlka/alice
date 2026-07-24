{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceNiri = {
    pkgs,
    lib,
    ...
  }: {};
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.aliceNiriPkg = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      extraPackages = with pkgs; [wireplumber];
      settings = {
        spawn-at-startup = [
          (lib.getExe pkgs.xsettingsd)
          (lib.getExe self'.packages.aliceNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        prefer-no-csd = true;

        hotkey-overlay."skip-at-startup" = _: {};

        cursor = {
          xcursor-theme = "AriaCursor";
          xcursor-size = 24;
        };

        input = {
          focus-follows-mouse = _: {};

          keyboard = {
            xkb = {
              layout = "us";
              options = "caps:escape";
            };
            repeat-rate = 40;
            repeat-delay = 250;
          };

          touchpad = {
            tap = _: {};
            natural-scroll = _: {};
            dwt = _: {};
          };

          mouse.accel-profile = "flat";
        };

        layout = {
          gaps = 8;
          center-focused-column = "never";

          focus-ring = {
            width = 2;
            active-color = "#e985b4";
            inactive-color = "#2b1712";
          };

          border.off = _: {};

          shadow = {
            color = "#16161dcc";
            inactive-color = "#16161d66";
            offset = _: {
              props = {
                x = 0;
                y = 4;
              };
            };
            softness = 24;
            spread = 2;
          };

          default-column-width.proportion = 0.5;

          preset-column-widths = [
            {proportion = 0.333;}
            {proportion = 0.5;}
            {proportion = 0.667;}
            {proportion = 1.0;}
          ];
        };

        animations = {
          slowdown = 0.8;
          workspace-switch.spring = _: {
            props = {
              damping-ratio = 1.0;
              stiffness = 800;
              epsilon = 0.0001;
            };
          };
          window-open.spring = _: {
            props = {
              damping-ratio = 0.85;
              stiffness = 600;
              epsilon = 0.0001;
            };
          };
          window-close.spring = _: {
            props = {
              damping-ratio = 0.85;
              stiffness = 600;
              epsilon = 0.0001;
            };
          };
          horizontal-view-movement.spring = _: {
            props = {
              damping-ratio = 1.0;
              stiffness = 800;
              epsilon = 0.0001;
            };
          };
        };

        window-rules = [
          {
            geometry-corner-radius = 12.0;
            clip-to-geometry = true;
          }
          {
            background-effect.blur = true;
          }
        ];

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = {};
          "Mod+F".maximize-column = {};
          "Mod+G".fullscreen-window = {};
          "Mod+Shift+F".toggle-window-floating = {};
          "Mod+C".center-column = {};

          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right = {};
          "Mod+K".focus-window-up = {};
          "Mod+J".focus-window-down = {};

          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};

          "Mod+Shift+H".move-column-left = {};
          "Mod+Shift+L".move-column-right = {};
          "Mod+Shift+K".move-window-up = {};
          "Mod+Shift+J".move-window-down = {};

          "Mod+Ctrl+H".focus-monitor-left = {};
          "Mod+Ctrl+L".focus-monitor-right = {};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;

          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;
          "Mod+Shift+5".move-column-to-workspace = 5;
          "Mod+Shift+6".move-column-to-workspace = 6;
          "Mod+Shift+7".move-column-to-workspace = 7;
          "Mod+Shift+8".move-column-to-workspace = 8;
          "Mod+Shift+9".move-column-to-workspace = 9;

          "Mod+Comma".consume-window-into-column = {};
          "Mod+Period".expel-window-from-column = {};
          "Mod+R".switch-preset-column-width = {};
          "Mod+Shift+R".reset-window-height = {};

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";
          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";

          "Mod+T".screenshot = {};
          "Mod+Shift+T".screenshot-screen = {};
          "Mod+Ctrl+T".screenshot-window = {};

          "XF86AudioRaiseVolume".spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.1+"
          ];
          "XF86AudioLowerVolume".spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.1-"
          ];
          "XF86AudioMute".spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];

          "XF86MonBrightnessUp".spawn-sh = "${lib.getExe pkgs.brightnessctl} s 5%+";
          "XF86MonBrightnessDown".spawn-sh = "${lib.getExe pkgs.brightnessctl} s 5%-";

          "Mod+S".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call launcher toggle";
          "Mod+M".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call media toggle";
          "Mod+Semicolon".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call launcher emoji";
          "Mod+D".spawn = ["discord"];
          "Mod+W".spawn = ["helium"];
          "Mod+Alt+W".spawn = [
            "flatpak"
            "run"
            "app.zen_browser.zen"
          ];

          "Mod+Alt+L".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call lockScreen lock";
          "Mod+Shift+W".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call wallpaper toggle";
          "Mod+Shift+I".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call controlCenter toggle";
          "Mod+E".spawn-sh = lib.getExe pkgs.nautilus;
          "Ctrl+Alt+Delete".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call sessionMenu toggle";
          "Mod+V".spawn-sh = "${lib.getExe self'.packages.aliceNoctalia} ipc call launcher clipboard";
          "Mod+Shift+P".power-off-monitors = {};
        };
        extraConfig = ''
          include "${pkgs.writeText "noctalia.kdl" (builtins.readFile ./noctalia.kdl)}"
        '';
      };
    };
  };
}
