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
  flake.nixosModules.helium-theme = {...}: {
    systemd.tmpfiles.rules = [
      "d /etc/chromium/policies/managed 0755 root root -"
      "f /etc/chromium/policies/managed/shoji-color.json 0644 alice users - {}"
      "z /etc/chromium/policies/managed/shoji-color.json 0644 alice users -"
    ];
  };
  flake.nixosModules.lumina-browser-settings = {...}: {
    imports = [
      inputs.lumina.nixosModules.helium-extensions
    ];
    lumina.helium.extensions = [
      "ghmbeldphafepmbegfdlkpapadhbakde"
      "jplgfhpmjnbigmhklmmbgecoobifkmpa"
      "hfjbmagddngcpeloejdejnfgbamkjaeg"
      "nbokbjkabcmbfdlbddjidfmibcpneigj"
      "hfjbmagddngcpeloejdejnfgbamkjaeg"
    ];
  };
}
