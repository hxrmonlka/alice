{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineGamingOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.nixosModules.gamingSettings];
    programs.steam.package = lib.mkForce pkgs.millennium-steam;
  };
}
