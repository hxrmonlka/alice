{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.yuzuBootSettings = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.nixosModules.serpentineBootSettings];
    boot.kernelPackages = lib.mkForce pkgs.cachyosKernels."linuxPackages-cachyos-lts";
  };
}
