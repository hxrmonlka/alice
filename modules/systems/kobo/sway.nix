{...}: {
  flake.custom.system-modules.kobo-sway = {
    config,
    lib,
    pkgs,
    ...
  }: let
    home = config.home.homeDirectory;
    mod = "Mod4";
    modCtrl = "${mod}+Ctrl";
    modAlt = "${mod}+Alt";
    modShift = "${mod}+Shift";
    terminal = "kitty";
    resizeStep = "40px";
    browser = "firefox";

    screenshot = pkgs.writeShellScript "kobo-screenshot" ''
      region=$(${pkgs.slurp}/bin/slurp) || exit 0
      ${pkgs.grim}/bin/grim -g "$region" - | ${pkgs.wl-clipboard}/bin/wl-copy --type image/png
    '';

    hmSessionVars = "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh";

    workspaces = map (n: {
      key = toString (lib.mod n 10);
      ws = toString n;
    }) (lib.range 1 10);

    workspaceBindings = lib.listToAttrs (lib.concatMap (w: [
        {
          name = "${mod}+${w.key}";
          value = "workspace number ${w.ws}";
        }
        {
          name = "${modShift}+${w.key}";
          value = "move container to workspace number ${w.ws}";
        }
      ])
      workspaces);
  in {
    options.kobo.wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "${home}/Pictures/Wallpapers/mana.jpg";
    };

    config = {
      home.file.".local/bin/sway-session" = {
        executable = true;
        text = ''
          #!/bin/sh
          [ -r /etc/profile ] && . /etc/profile
          export PATH="${config.home.profileDirectory}/bin:/nix/var/nix/profiles/default/bin:$PATH"
          [ -r "${hmSessionVars}" ] && . "${hmSessionVars}"
          if command -v dbus-run-session >/dev/null 2>&1; then
            exec dbus-run-session sway "$@"
          fi
          exec sway "$@"
        '';
      };

      wayland.windowManager.sway = {
        enable = true;
        package = null;
        checkConfig = false;
        systemd.enable = false;
        xwayland = true;
        config = {
          window.border = 0;
          floating.border = 0;
          modifier = mod;
          inherit terminal;
          menu = "wmenu-run";
          bars = [];
          floating.modifier = mod;
          focus.wrapping = "yes";
          output."*".bg = "${config.kobo.wallpaper} fill";
          startup = [
            {command = "${config.programs.waybar.package}/bin/waybar";}
          ];
          keybindings =
            {
              "${mod}+Return" = "exec ${terminal}";
              "${mod}+s" = "exec ${browser}";
              "${mod}+d" = "exec wmenu-run";
              "${mod}+Tab" = "focus next";
              "${mod}+w" = "kill";
              "${mod}+e" = "exec nautilus";
              "${mod}+a" = "exec ${screenshot}";
              "${mod}+b" = "exec swaymsg exit";

              "${mod}+p" = "focus up";
              "${mod}+l" = "focus left";
              "${mod}+semicolon" = "focus down";
              "${mod}+apostrophe" = "focus right";

              "${mod}+bracketleft" = "resize shrink width ${resizeStep}";
              "${mod}+bracketright" = "resize grow width ${resizeStep}";

              "${modShift}+l" = "exec swaylock -f";
              "${modShift}+c" = "reload";
            }
            // workspaceBindings;
        };
      };

      programs.swaylock = {
        enable = true;
        package = pkgs.swaylock;
        settings = {
          color = "1e1e2e";
          show-failed-attempts = true;
          ignore-empty-password = true;
        };
      };
    };
  };
}
