{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.dgreet = {pkgs, ...}: {
    services.displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default;
      configHome = "/home/alice";
      configFiles = ["/home/alice/.config/DankMaterialShell/settings.json"];
      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };
  };

  flake.custom.aliceModules.dms = {pkgs, ...}: {
    programs.dank-material-shell = {
      enable = true;
      systemd.enable = false;

      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;

      dgop.package = inputs.dgop.packages.${pkgs.stdenv.hostPlatform.system}.default;

      settings = (builtins.fromJSON (builtins.readFile ./dms-settings.json)).settings or {};
      session = (builtins.fromJSON (builtins.readFile ./dms-settings.json)).session or {};

      clipboardSettings = {
        autoClearDays = 1;
        clearAtStartup = true;
        disabled = false;
        disableHistory = false;
        disablePersist = true;
      };
    };
  };
}
