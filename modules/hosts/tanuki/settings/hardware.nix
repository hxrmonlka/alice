{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiHardware = {...}: {
    imports = [
      inputs.nixos-hardware.nixosModules.asus-fa506nc
      self.custom.hardwareModules.vulkan
    ];

    hardware.nvidia.prime.offload.enable = true;
    hardware.nvidia.powerManagement.enable = true;

    hardware.alice.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
