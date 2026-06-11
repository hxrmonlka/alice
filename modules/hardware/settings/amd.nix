{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.amdSettings = {...}: {
    imports = [
      self.custom.hardwareModules.hardwareAmd
      self.custom.hardwareModules.vulkan
    ];
    hardware.alice.amd = {
      enable = true;
      cpu.enable = true;
      gpu.enable = true;
    };
    hardware.alice.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
