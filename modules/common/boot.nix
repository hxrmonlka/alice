# boot.nix is shared in a way, use lib.mkForce on boot.kernelPackages while importing this module.
{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.bootSettings = {pkgs, ...}: {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
    boot.kernelPackages = pkgs.cachyosKernels."linuxPackages-cachyos-latest";
  };
}
