{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceProgramsBrowser =
    { pkgs, ... }:
    {
      programs.chromium = {
        enable = true;
        package = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
}
