{
  self,
  inputs,
  ...
}: {
  flake.custom.aux-mini.boot = {
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.custom.commonModules.bootSettings
    ];
    boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
  };
}
