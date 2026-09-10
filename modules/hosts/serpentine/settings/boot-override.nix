# TODO: ouu shii, i have to get a better way of organizing overrides...
{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.bootOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.custom.commonModules.bootSettings];
    boot.kernelPackages = lib.mkForce pkgs.cachyosKernels."linuxPackages-cachyos-latest";
  };
}
