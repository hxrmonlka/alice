{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.spotify = {
    inputs,
    pkgs,
    ...
  }: {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
      ];

      theme = spicePkgs.themes.dribbblish;
      colorScheme = "catppuccin-mocha";

      #      customColorScheme = {
      #        text = "FFFFFF";
      #        subtext = "999999";
      #        nav-active-text = "FFFFFF";
      #        main = "000000";
      #        sidebar = "1A1A1A";
      #        player = "1A1A1A";
      #        card = "1A1A1A";
      #        shadow = "000000";
      #        main-secondary = "2E2E2E";
      #        button = "FFFFFF";
      #        button-secondary = "999999";
      #        button-active = "FFFFFF";
      #        button-disabled = "4D4D4D";
      #        nav-active = "FFFFFF";
      #        play-button = "FFFFFF";
      #        tab-active = "1A1A1A";
      #        notification = "CCCCCC";
      #        notification-error = "808080";
      #        playback-bar = "FFFFFF";
      #        misc = "FFFFFF";
      #      };
    };
  };
}
