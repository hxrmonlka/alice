{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.noctHardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "sd_mod"
      "sdhci_pci"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/119d1f73-c029-481c-b514-a81654259e5c";
      fsType = "btrfs";
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/119d1f73-c029-481c-b514-a81654259e5c";
      fsType = "btrfs";
      options = ["subvol=home"];
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/119d1f73-c029-481c-b514-a81654259e5c";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/5904-B0D9";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/28890ced-3ad9-4e79-b299-2f08201a3f32";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
