{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.otdSettings = {...}: {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
