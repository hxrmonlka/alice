{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.browser = {pkgs, ...}: {
    programs.chromium = {
      enable = true;
      package = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
