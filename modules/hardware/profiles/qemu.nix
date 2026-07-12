{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.qemuHardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [
      "ahci"
      "sd_mod"
      "sr_mod"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/7cf52ff7-e6ba-4aba-9e10-1c94ee95ffe6";
      fsType = "btrfs";
      options = ["subvol=@"];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/7cf52ff7-e6ba-4aba-9e10-1c94ee95ffe6";
      fsType = "btrfs";
      options = ["subvol=@home"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/76E0-588F";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/3f24505c-3905-4a85-b20d-88cf4f1bcabc";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
