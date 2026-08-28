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
      mango.enable = true;
      nix-ld.enable = true;
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
      };
      dsearch = {
        enable = true;
        package = inputs.danksearch.packages.${pkgs.stdenv.hostPlatform.system}.default;
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
      appimage = {
        enable = true;
        binfmt = true;
      };
    };
  };
}
