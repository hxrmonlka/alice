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

  flake.custom.aliceModules.spotifyMatugen = {
    inputs,
    lib,
    pkgs,
    config,
    ...
  }: let
    liveApply = inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.spicetify-live-apply;
    liveDir = "${config.xdg.dataHome}/alice/spicetify-live";
    colorFile = "${config.xdg.stateHome}/alice/spicetify-colors.json";
    spicetifyLive = pkgs.writeShellScriptBin "spicetify-live" ''
      exec ${liveApply}/bin/spicetify-live-apply \
        --base "${config.programs.spicetify.spicedSpotify}/share/spotify" \
        --colors "${colorFile}" \
        --live-dir "${liveDir}"
    '';
  in {
    home.packages = [spicetifyLive];

    xdg.desktopEntries.spotify = {
      name = "Spotify";
      genericName = "Music Player";
      comment = "Play music from Spotify";
      icon = "spotify-client";
      exec = "${liveDir}/spotify %U";
      terminal = false;
      categories = ["Audio" "Music" "Player" "AudioVideo"];
      mimeType = ["x-scheme-handler/spotify"];
      settings = {
        StartupWMClass = "spotify";
      };
    };

    xdg.configFile."matugen/templates/spicetify-colors.json".source = ./toml/spicetify-matugen.json;
    xdg.configFile."matugen/config.toml".text = lib.mkAfter ''

      [templates.spicetify]
      input_path = '${config.xdg.configHome}/matugen/templates/spicetify-colors.json'
      output_path = '${colorFile}'
      post_hook = 'spicetify-live'
    '';

    home.activation.aliceStateDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run mkdir -p ${config.xdg.stateHome}/alice
    '';

    home.activation.spicetifyLiveSeed = lib.hm.dag.entryAfter ["aliceStateDir"] ''
      run ${spicetifyLive}/bin/spicetify-live
    '';
  };
}
