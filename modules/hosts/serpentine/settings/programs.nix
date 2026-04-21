{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.serpentineProgramsConfig =
    { pkgs, ... }:
    {
      programs = {
        firefox = {
          enable = true;
          package = pkgs.firefox;
        };
        nix-ld.enable = true;
        niri = {
          enable = true;
          package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
        };
      };
    };
}
