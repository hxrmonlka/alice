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
  flake.nixosModules.lumina-browser-settings = {...}: {
    imports = [
      inputs.lumina.nixosModules.helium-extensions
    ];
    lumina.helium.extensions = [
      "ghmbeldphafepmbegfdlkpapadhbakde"
      "jplgfhpmjnbigmhklmmbgecoobifkmpa"
      "hfjbmagddngcpeloejdejnfgbamkjaeg"
    ];
  };
}
