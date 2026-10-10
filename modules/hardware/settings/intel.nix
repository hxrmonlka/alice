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
