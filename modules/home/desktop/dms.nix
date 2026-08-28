{
  inputs,
  self,
  ...
}: {
  flake.custom.userModules.aliceDms = {pkgs, ...}: {
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
