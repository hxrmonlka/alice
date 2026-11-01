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
    hardware.lumina.amd = {
      cpu.enable = true;
      gpu.enable = true;
    };
    hardware.lumina.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
