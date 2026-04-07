{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinBootSettings = {pkgs, ...}: {
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
