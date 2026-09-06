{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.systemServices = {pkgs, ...}: {
    hardware = {
      bluetooth.enable = true;
    };
    services = {
      input-remapper = {
        enable = false;
        enableUdevRules = false;
      };
      power-profiles-daemon.enable = true;
      upower.enable = true;
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      printing.enable = false;
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };
  };
}
