{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.intelSettings = {...}: {
    imports = [
      self.custom.hardwareModules.hardwareIntel
    ];
    hardware.alice.intel = {
      gpu = {
        enable = true;
        generation = "legacy";
        openclLegacy = true;
      };
      cpu.enable = true;
    };
  };
}
