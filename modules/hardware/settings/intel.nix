{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.intelSettings = {...}: {
    imports = [
      inputs.lumina.lib.hardware.intel
      inputs.lumina.lib.hardware.vulkan
    ];
    hardware.lumina.intel = {
      gpu = {
        enable = true;
        generation = "legacy";
        openclLegacy = true;
      };
      cpu.enable = true;
    };
    hardware.lumina.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
