{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.spotify = {
    inputs,
    lib,
    pkgs,
    config,
    osConfig ? {},
    ...
  }: let
    system = pkgs.stdenv.hostPlatform.system;
    spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
    isEkpyrosis = ((osConfig.networking or {}).hostName or "") == "ekpyrosis";
  in {
    imports = [inputs.lumina.homeModules.spicetify-live];

    config = lib.mkMerge [
      (lib.mkIf isEkpyrosis {
        programs.spicetify.enable = false;

        home.packages = [
          (pkgs.writeShellApplication {
            name = "shoji-spicetify-apply";
            text = ''
              exec lumina-spicetify-apply
            '';
          })
        ];

        lumina.spicetify = {
          enable = true;
          spotifyPackage = pkgs.spotify;
          liveDir = "${config.home.homeDirectory}/.local/share/spotify-shoji-live";
          theme = {
            name = "ShojiText";
            src = spicePkgs.themes.text.src;
            patches = spicePkgs.themes.text.patches;
          };
          colors = {
            file = "${config.xdg.stateHome}/shoji/spotify-colors.json";
            fallback = {
              accent = "ebbcba";
              "accent-active" = "ebbcba";
              "accent-inactive" = "1f1d2e";
              banner = "ebbcba";
              "border-active" = "ebbcba";
              "border-inactive" = "26233a";
              header = "6e6a86";
              highlight = "403d52";
              main = "191724";
              notification = "31748f";
              "notification-error" = "eb6f92";
              subtext = "908caa";
              text = "e0def4";
            };
          };
          extensions =
            map (extension: {inherit (extension) src name;})
            (with spicePkgs.extensions; [
              adblock
              shuffle
            ]);
          watchColors = true;
        };
      })
      (lib.mkIf (!isEkpyrosis) {
        programs.spicetify = {
          enable = true;
          enabledExtensions = with spicePkgs.extensions; [
            adblock
            shuffle
          ];
          theme = spicePkgs.themes.text;
          colorScheme = "RosePine";
        };
      })
    ];
  };
}
