{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.dgreet = {
    pkgs,
    config,
    ...
  }: {
    imports = [inputs.dank-greeter.nixosModules.default];
    programs.dms-greeter = {
      enable = true;
      package = inputs.dank-greeter.packages.${pkgs.stdenv.hostPlatform.system}.dms-greeter;
      compositor.name = "mango";
      configHome = "/home/alice";
      configFiles = ["${config.users.users.alice.home}/.config/DankMaterialShell/settings.json"];
      logs = {
        save = false;
        path = "/tmp/dms-greeter.log";
      };
    };
  };

  flake.custom.alice.dms = {
    pkgs,
    lib,
    ...
  }: {
    programs.dank-material-shell = {
      enable = true;
      systemd.enable = false;

      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;

      settings = builtins.fromJSON (builtins.readFile ./dms-settings.json);
      session = {};

      clipboardSettings = {
        autoClearDays = 1;
        clearAtStartup = true;
        disabled = false;
        disableHistory = false;
        disablePersist = true;
      };
    };

    home.activation.maskDmsSystemdUnit = lib.hm.dag.entryAfter ["writeBoundary"] ''
      export XDG_RUNTIME_DIR="''${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
      ${pkgs.systemd}/bin/systemctl --user disable --now dms.service 2>/dev/null || true
      ${pkgs.systemd}/bin/systemctl --user mask dms.service 2>/dev/null || true
    '';
  };
}
