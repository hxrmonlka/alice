{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinProgramsConfig = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox;
      };
      steam.enable = true;
      nix-ld.enable = true;
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
      };
    };
  };
}
