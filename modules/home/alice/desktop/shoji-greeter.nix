{inputs, ...}: {
  flake.nixosModules.shojiGreeter = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.shoji.greeter;
    system = pkgs.stdenv.hostPlatform.system;
    qs = inputs.quickshell.packages.${system}.default;
    mango = config.programs.mango.package;
    dir = "/var/cache/shoji-greeter";
    sessions = config.services.displayManager.sessionData.desktops;
    path = lib.makeBinPath [
      mango
      qs
      pkgs.bash
      pkgs.coreutils
      pkgs.gawk
      pkgs.gnused
      pkgs.networkmanager
      pkgs.getent
      pkgs.systemd
    ];
    start = pkgs.writeShellScript "shoji-greeter-start" ''
      exec >${dir}/greeter.log 2>&1
      ${pkgs.coreutils}/bin/env
      ${qs}/bin/qs -p ${inputs.shoji}/greeter.qml
      echo "qs exited with $?"
      ${mango}/bin/mmsg -d quit
    '';
    mangoConf = pkgs.writeText "shoji-greeter-mango.conf" ''
      exec_once=${pkgs.runtimeShell} ${start}
    '';
  in {
    options.shoji.greeter.enable = lib.mkEnableOption "the shoji greeter";

    config = lib.mkMerge [
      {
        systemd.tmpfiles.rules = ["d ${dir} 0775 greeter greeter -"];
      }
      (lib.mkIf cfg.enable {
        services.greetd = {
          enable = true;
          settings.default_session = {
            user = "greeter";
            command = "${pkgs.coreutils}/bin/env PATH=${path} HOME=${dir} SHOJI_GREETER_STATE=${dir}/state.json SHOJI_GREETER_SESSION_LOG=${dir}/session.log XDG_DATA_DIRS=${sessions}/share:/run/current-system/sw/share ${mango}/bin/mango -c ${mangoConf}";
          };
        };
      })
    ];
  };

  flake.custom.alice.shojiGreeterSync = {
    lib,
    pkgs,
    ...
  }: {
    systemd.user.services.shoji-greeter-sync = {
      Unit.Description = "Sync shoji wallpaper, colors and face to the greeter";
      Service = {
        Type = "oneshot";
        Environment = ["PATH=${lib.makeBinPath [pkgs.coreutils pkgs.gnused]}"];
        ExecStart = "${pkgs.runtimeShell} ${inputs.shoji}/scripts/greeter-sync.sh /var/cache/shoji-greeter";
      };
      Install.WantedBy = ["default.target"];
    };

    systemd.user.paths.shoji-greeter-sync = {
      Unit.Description = "Watch shoji wallpaper and colors";
      Path.PathChanged = [
        "%h/.local/state/shoji/wallpaper.json"
        "%h/.local/state/shoji/colors.json"
      ];
      Install.WantedBy = ["default.target"];
    };
  };
}
