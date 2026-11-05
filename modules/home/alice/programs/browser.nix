{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.browser = {pkgs, ...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];
    programs = {
      chromium = {
        enable = true;
        package = inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      zen-browser = {
        enable = true;
        profiles.default = {
          search = {
            default = "google";

            engines = {
              wikipedia = {
                name = "Wikipedia";
                urls = [
                  {
                    template = "https://en.wikipedia.org/w/index.php?search={searchTerms}";
                  }
                ];
                definedAliases = ["@mw"];
              };

              mynixos = {
                name = "My NixOS";
                urls = [
                  {
                    template = "https://mynixos.com/search?q={searchTerms}";
                  }
                ];
                definedAliases = ["@mn" "@mynixos"];
              };

              nix-packages = {
                name = "Nix Packages";
                urls = [
                  {
                    template = "https://search.nixos.org/packages?query={searchTerms}";
                  }
                ];
                definedAliases = ["@np" "@nixpkgs"];
              };

              kagi = {
                name = "Kagi";
                urls = [
                  {
                    template = "https://kagi.com/search?q={searchTerms}";
                  }
                ];
                definedAliases = ["@k" "@kagi"];
              };

              google = {
                name = "Google";
                urls = [
                  {
                    template = "https://duckduckgo.com/?q={searchTerms}";
                  }
                ];
                definedAliases = ["@g" "@google"];
              };
            };
          };
        };
      };
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
