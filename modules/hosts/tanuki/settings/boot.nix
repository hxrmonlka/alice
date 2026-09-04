{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiBootOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.custom.commonModules.bootSettings];
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
  };
}
