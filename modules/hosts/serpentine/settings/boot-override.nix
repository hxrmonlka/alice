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
    boot.loader.grub.theme = "${inputs.lumina.packages.${pkgs.system}.grub-theme}/grub/themes/tela";
  };
}
