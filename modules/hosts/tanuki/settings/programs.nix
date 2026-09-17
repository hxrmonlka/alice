{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.programs = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
      };
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.konoeNiriPkg;
      };
      appimage = {
        enable = true;
        binfmt = true;
      };
      nh = {
        enable = true;
        flake = "/home/konoe/.local/alice/";
        clean = {
          enable = true;
          dates = "monthly";
          extraArgs = "--keep 5";
        };
      };
    };
  };
}
