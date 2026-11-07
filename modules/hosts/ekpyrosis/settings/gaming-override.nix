{
  self,
  inputs,
  ...
}: {
  flake.custom.ekpyrosis.gamingOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.nixosModules.gamingSettings];

    programs.steam.package = lib.mkForce pkgs.millennium-steam;
  };
}
