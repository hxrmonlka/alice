{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.amdSettings = {...}: {
    imports = [
      inputs.lumina.lib.hardware.amd
      inputs.lumina.lib.hardware.vulkan
    ];
    hardware.alice.amd = {
      cpu.enable = true;
      gpu.enable = true;
    };
    hardware.alice.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
