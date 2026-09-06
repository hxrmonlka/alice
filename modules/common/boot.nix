# boot.nix is shared in a way: boot.kernelPackages should have lib.mkForce with override value upon using this module.
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
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
