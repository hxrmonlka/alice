{...}: {
  flake.custom.system-modules.kobo-waybar = {pkgs, ...}: {
    fonts.fontconfig.enable = true;

    home.packages = [pkgs.jetbrains-mono];

    programs.waybar = {
      enable = true;
      systemd.enable = false;
      settings.main = {
        layer = "top";
        position = "top";
        height = 26;
        spacing = 0;
        modules-left = ["sway/workspaces"];
        modules-center = ["clock"];
        modules-right = ["network"];

        "sway/workspaces" = {
          format = "{name}";
          disable-scroll = true;
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        clock = {
          format = "{:%a %H:%M}";
          format-alt = "{:%d %B %Y}";
          tooltip = false;
        };

        network = {
          interval = 3;
          format-wifi = "{essid} {signalStrength}%";
          format-ethernet = "Wired";
          format-disconnected = "No WiFi";
          tooltip-format-wifi = "{essid} ({frequency} GHz)\n{ipaddr}";
          tooltip-format-disconnected = "Disconnected";
        };
      };

      style = ''
        * {
          border: none;
          border-radius: 0;
          min-height: 0;
          font-family: "JetBrains Mono";
          font-size: 12px;
        }

        window#waybar {
          background-color: #1e1e2e;
          color: #cdd6f4;
        }

        .modules-left {
          margin-left: 8px;
        }

        .modules-right {
          margin-right: 8px;
        }

        #workspaces button {
          padding: 0 6px;
          color: #cdd6f4;
          background: transparent;
          opacity: 0.5;
        }

        #workspaces button.focused,
        #workspaces button.active {
          opacity: 1;
        }

        #workspaces button.urgent {
          color: #f38ba8;
          opacity: 1;
        }

        #clock {
          margin: 0 8px;
        }

        #network {
          margin-left: 8px;
        }
      '';
    };
  };
}
