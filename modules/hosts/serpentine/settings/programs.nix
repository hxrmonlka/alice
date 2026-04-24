{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineProgramsConfig = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox;
      };
      mangowc.enable = true;
      nix-ld.enable = true;
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
      };
      nh = {
        enable = true;
        flake = "/home/alice/alice";
        clean = {
          enable = true;
          dates = "monthly";
          extraArgs = "--keep 5";
        };
      };
    };
  };
}
