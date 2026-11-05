{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.programs = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".beta
    ];
    programs = {
      zen-browser = {
        enable = true;
        profiles.default = {
          search = {
            default = "google";

            engines = {
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
      firefox = {
        enable = true;
        package = pkgs.firefox;
      };
      tmux = {
        enable = true;
        keyMode = "vi";
        clock24 = true;
        baseIndex = 1;
        extraConfig = ''
          set -g default-shell ${lib.getExe pkgs.nushell}
          unbind C-b
          set -g prefix C-s
          bind C-s send-prefix
          bind h select-pane -L
          bind j select-pane -D
          bind k select-pane -U
          bind l select-pane -R

          bind H resize-pane -L 5
          bind J resize-pane -D 5
          bind K resize-pane -U 5
          bind L resize-pane -R 5
        '';
      };
      mango.enable = true;
      nix-ld.enable = true;
      niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg;
      };
      dux-search = {
        enable = true;
        package = inputs.danksearch.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
      nh = {
        enable = true;
        flake = "/home/alice/.alice";
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
      thunar = {
        enable = true;
        plugins = with pkgs; [
          thunar-archive-plugin
          thunar-media-tags-plugin
          thunar-vcs-plugin
          thunar-shares-plugin
          thunar-volman
        ];
      };
    };
  };
}
