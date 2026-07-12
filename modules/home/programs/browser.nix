{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceBrowser = {pkgs, ...}: {
    programs.chromium = {
      enable = true;
      package = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
