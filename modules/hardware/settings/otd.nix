{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.otdSettings = {...}: {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
