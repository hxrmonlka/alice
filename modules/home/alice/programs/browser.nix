{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.browser = {pkgs, ...}: {
    programs.chromium = {
      enable = true;
      package = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
  };
}
