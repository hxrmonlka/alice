{
  self,
  inputs,
  ...
}: {
  flake.custom.konoe.spotify = {
    pkgs,
    inputs,
    ...
  }: {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
      ];

      theme = spicePkgs.themes.text;
      colorScheme = "rigel";
    };
  };
}
