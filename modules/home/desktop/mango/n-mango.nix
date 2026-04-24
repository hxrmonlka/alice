{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mangoWC = {
    pkgs,
    lib,
    ...
  }: {
    programs.mangowc = {
      enable = true;
    };
  };
}
