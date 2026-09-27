{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.gamingOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.nixosModules.gamingSettings];

    programs.steam.package = lib.mkForce pkgs.millennium-steam;
  };
}
