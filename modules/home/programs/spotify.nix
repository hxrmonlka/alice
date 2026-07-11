{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceSpotify = {
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
      theme =
        spicePkgs.themes.text
        // {
          overwriteAssets = true;
        };
      colorScheme = {
        text = "FFFFFF";
        subtext = "B3B3B3";
        main = "000000";
        highlight = "1A1A1A";
        banner = "FFFFFF";
        header = "FFFFFF";
        accent = "FFFFFF";
        accent-active = "FFFFFF";
        accent-inactive = "808080";
        border-active = "FFFFFF";
        border-inactive = "4D4D4D";
        notification = "FFFFFF";
        notification-error = "FFFFFF";
      };
    };
  };
}
