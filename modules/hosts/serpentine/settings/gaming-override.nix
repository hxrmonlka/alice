{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineGamingOverride = {
    pkgs,
    lib,
    ...
  }: {programs.steam.package = lib.mkForce pkgs.millennium-steam;};
}
