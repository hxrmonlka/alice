{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceNiri = {
    pkgs,
    lib,
    ...
  }: {
    programs.niri = {
      enable = true;
    };
  };
  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.aliceNiriPkg = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      extraPackages = with pkgs; [
        wireplumber
      ];
      settings = {
        spawn-at-startup = [
          # (lib.getExe self'.packages.aliceNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        prefer-no-csd = true;
        cursor = {
          theme = "NangongYuCursor";
          size = 24;
        };
        input = {
          focus-follows-mouse.enable = true;
          keyboard = {
            xkb = {
              layout = "us";
              options = "caps:escape";
            };
            repeat-rate = 40;
            repeat-delay = 250;
          };
          touchpad = {
            tap = true;
            natural-scroll = true;
            dwt = true;
          };
          mouse.accel-profile = "flat";
        };
        layout = {
          gaps = 8;
          center-focused-column = "never";

          focus-ring = {
            enable = true;
            width = 2;
            active.color = "#7e9cd8"; # crystalBlue
            inactive.color = "#363646"; # sumiInk3
          };

          border.enable = false;

          shadow = {
            enable = true;
            color = "#16161dcc"; # sumiInk0 @ 80%
            inactive-color = "#16161d66"; # sumiInk0 @ 40%
            offset = {
              x = 0;
              y = 4;
            };
            softness = 24;
            spread = 2;
          };

          default-column-width = {
            proportion = 0.5;
          };

          preset-column-widths = [
            {proportion = 0.333;}
            {proportion = 0.5;}
            {proportion = 0.667;}
            {proportion = 1.0;}
          ];
        };
        animations = {
          slowdown = 0.8;
          workspace-switch.kind.spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
          window-open.kind.spring = {
            damping-ratio = 0.85;
            stiffness = 600;
            epsilon = 0.0001;
          };
          window-close.kind.spring = {
            damping-ratio = 0.85;
            stiffness = 600;
            epsilon = 0.0001;
          };
          horizontal-view-movement.kind.spring = {
            damping-ratio = 1.0;
            stiffness = 800;
            epsilon = 0.0001;
          };
        };
        window-rules = [
          {
            geometry-corner-radius = {
              top-left = 8.0;
              top-right = 8.0;
              bottom-left = 8.0;
              bottom-right = 8.0;
            };
            clip-to-geometry = true;
          }
        ];
        binds = {
          "Mod+Return".action.spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".action.close-window = {};
          "Mod+F".action.maximize-column = {};
          "Mod+G".action.fullscreen-window = {};
          "Mod+Shift+F".action.toggle-window-floating = {};
          "Mod+C".action.center-column = {};

          "Mod+H".action.focus-column-left = {};
          "Mod+L".action.focus-column-right = {};
          "Mod+K".action.focus-window-up = {};
          "Mod+J".action.focus-window-down = {};

          "Mod+Left".action.focus-column-left = {};
          "Mod+Right".action.focus-column-right = {};
          "Mod+Up".action.focus-window-up = {};
          "Mod+Down".action.focus-window-down = {};

          "Mod+Shift+H".action.move-column-left = {};
          "Mod+Shift+L".action.move-column-right = {};
          "Mod+Shift+K".action.move-window-up = {};
          "Mod+Shift+J".action.move-window-down = {};

          "Mod+Ctrl+H".action.focus-monitor-left = {};
          "Mod+Ctrl+L".action.focus-monitor-right = {};

          "Mod+1".action.focus-workspace = 1;
          "Mod+2".action.focus-workspace = 2;
          "Mod+3".action.focus-workspace = 3;
          "Mod+4".action.focus-workspace = 4;
          "Mod+5".action.focus-workspace = 5;
          "Mod+6".action.focus-workspace = 6;
          "Mod+7".action.focus-workspace = 7;
          "Mod+8".action.focus-workspace = 8;
          "Mod+9".action.focus-workspace = 9;

          "Mod+Shift+1".action.move-column-to-workspace = 1;
          "Mod+Shift+2".action.move-column-to-workspace = 2;
          "Mod+Shift+3".action.move-column-to-workspace = 3;
          "Mod+Shift+4".action.move-column-to-workspace = 4;
          "Mod+Shift+5".action.move-column-to-workspace = 5;
          "Mod+Shift+6".action.move-column-to-workspace = 6;
          "Mod+Shift+7".action.move-column-to-workspace = 7;
          "Mod+Shift+8".action.move-column-to-workspace = 8;
          "Mod+Shift+9".action.move-column-to-workspace = 9;

          "Mod+Comma".action.consume-window-into-column = {};
          "Mod+Period".action.expel-window-from-column = {};

          "Mod+R".action.switch-preset-column-width = {};
          "Mod+Shift+R".action.reset-window-height = {};

          "Mod+Minus".action.set-column-width = "-10%";
          "Mod+Equal".action.set-column-width = "+10%";
          "Mod+Shift+Minus".action.set-window-height = "-10%";
          "Mod+Shift+Equal".action.set-window-height = "+10%";

          "Print".action.screenshot = {};
          "Mod+Print".action.screenshot-screen = {};
          "Mod+Shift+Print".action.screenshot-window = {};

          "XF86AudioRaiseVolume".action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.1+"
          ];
          "XF86AudioLowerVolume".action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.1-"
          ];
          "XF86AudioMute".action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];
          "XF86MonBrightnessUp".action.spawn-sh = "${lib.getExe pkgs.brightnessctl} s 5%+";
          "XF86MonBrightnessDown".action.spawn-sh = "${lib.getExe pkgs.brightnessctl} s 5%-";
          "Mod+S".action.spawn = "${lib.getExe self'.packages.aliceNoctalia} ipc call launcher toggle";
          "Mod+D".action.spawn-sh = lib.getExe pkgs.wlr-which-key;

          "Mod+Shift+E".action.quit.skip-confirmation = true;
          "Mod+Shift+P".action.power-off-monitors = {};
        };
      };
    };
  };
}
