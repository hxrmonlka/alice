{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.yuzuServices = {...}: {
    services = {
      xserver.enable = true;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };
  };
}
