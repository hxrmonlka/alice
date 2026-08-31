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

      theme = spicePkgs.themes.text;

      # TODO: Use Lumina as a script injector for DMS' Matugen User Template.
      customColorScheme = {
        text = "FFFFFF";
        subtext = "999999";
        main = "000000";
        highlight = "1A1A1A";
        header = "2E2E2E";
        accent = "FFFFFF";
        accent-active = "FFFFFF";
        accent-inactive = "1A1A1A";
        banner = "FFFFFF";
        border-active = "FFFFFF";
        border-inactive = "4D4D4D";
        notification = "CCCCCC";
        notification-error = "808080";
      };
    };
  };
}
