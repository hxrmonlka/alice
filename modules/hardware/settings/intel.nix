{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.intelSettings = {...}: {
    imports = [
      inputs.lumina.lib.hardware.intel
      inputs.lumina.lib.hardware.vulkan
      inputs.nixos-hardware.nixosModules.common-cpu-intel
      inputs.nixos-hardware.nixosModules.common-pc-laptop
      inputs.nixos-hardware.nixosModules.common-pc-ssd
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
