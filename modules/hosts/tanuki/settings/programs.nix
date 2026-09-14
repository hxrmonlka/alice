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
    };
  };
}
