{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.asusSettings = {...}: {
    imports = [
      inputs.nixos-hardware.nixosModules.asus-fa506nc
      inputs.lumina.lib.hardware.vulkan
    ];

    hardware.nvidia.prime.offload.enable = true;
    hardware.nvidia.powerManagement.enable = true;

    services.udev.extraRules = ''
      SUBSYSTEM=="drm", KERNEL=="card[0-9]", SUBSYSTEMS=="pci", ATTRS{vendor}=="0x1002", TAG+="mutter-device-preferred-primary"
    '';

    hardware.alice.vulkan = {
      enable = true;
      tools = true;
    };
  };
}
