{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.intelSettings = {...}: {
    imports = [
      self.custom.hardwareModules.hardwareIntel
      self.custom.hardwareModules.vulkan
    ];
    hardware.alice.intel = {
      gpu = {
        enable = true;
        generation = "legacy";
        openclLegacy = true;
      };
      cpu.enable = true;
    };
    hardware.alice.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
