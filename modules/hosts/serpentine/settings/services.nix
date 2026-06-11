{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineServices = {...}: {
    hardware = {
      bluetooth.enable = true;
    };
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      printing.enable = true;
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
