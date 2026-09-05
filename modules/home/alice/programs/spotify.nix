{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.spotify = {
    inputs,
    pkgs,
    config,
    ...
  }: {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      colorFile = "${config.xdg.stateHome}/alice/spicetify-colors.json";
      fallbackColors = {
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
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
      ];

      theme = spicePkgs.themes.text;

      customColorScheme =
        if builtins.pathExists colorFile
        then builtins.fromJSON (builtins.readFile colorFile)
        else fallbackColors;
    };
  };

  flake.custom.aliceModules.spotifyMatugen = {
    lib,
    config,
    ...
  }: {
    xdg.configFile."matugen/templates/spicetify-colors.json".source = ./toml/spicetify-matugen.json;
    xdg.configFile."matugen/config.toml".text = lib.mkAfter ''

      [templates.spicetify]
      input_path = '${config.xdg.configHome}/matugen/templates/spicetify-colors.json'
      output_path = '${config.xdg.stateHome}/alice/spicetify-colors.json'
    '';

    home.activation.aliceStateDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run mkdir -p ${config.xdg.stateHome}/alice
    '';
  };
}
