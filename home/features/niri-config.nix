{ config, pkgs, lib, ... }:

{
  programs.niri = {
    enable = true;
    settings = {
      input = {
        focus-follows-mouse = {
          enable = true;
        };
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
        };
        mouse = {
          accel-profile = "flat";
        };
      };

      layout = {
        gaps = 5;
        focus-ring = {
          enable = true;
          width = 2;
          active-color = "#8ec07c"; # Using a green color similar to Vimjoyer's theme
        };
        default-column-width = { proportion = 0.5; };
      };

      binds = with config.lib.niri; {
        "Mod+Return".action = spawn "kitty";
        "Mod+Q".action = close-window;
        "Mod+F".action = maximize-column;
        "Mod+G".action = fullscreen-window;
        "Mod+Shift+F".action = toggle-window-floating;
        "Mod+C".action = center-column;

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+K".action = focus-window-up;
        "Mod+J".action = focus-window-down;

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+Down".action = focus-window-down;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-window-up;
        "Mod+Shift+J".action = move-window-down;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        "Mod+Shift+1".action = move-column-to-workspace 1;
        "Mod+Shift+2".action = move-column-to-workspace 2;
        "Mod+Shift+3".action = move-column-to-workspace 3;
        "Mod+Shift+4".action = move-column-to-workspace 4;
        "Mod+Shift+5".action = move-column-to-workspace 5;
        "Mod+Shift+6".action = move-column-to-workspace 6;
        "Mod+Shift+7".action = move-column-to-workspace 7;
        "Mod+Shift+8".action = move-column-to-workspace 8;
        "Mod+Shift+9".action = move-column-to-workspace 9;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = reset-window-height;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Print".action = screenshot;
        "Mod+Print".action = screenshot-screen;
        "Mod+Shift+Print".action = screenshot-window;

        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";

        # Vimjoyer's specific keybinds
        "Mod+S".action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
        "Mod+D".action = spawn "wlr-which-key";
      };

      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
        { command = [ "swaybg" "-i" "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg" "-m" "fill" ]; }
      ];
    };
  };
}
