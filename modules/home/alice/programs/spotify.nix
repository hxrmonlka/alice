{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.spotify = {
    inputs,
    pkgs,
    config,
    osConfig ? {},
    ...
  }: let
    system = pkgs.stdenv.hostPlatform.system;
    spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
    isShojiHost = ((osConfig.networking or {}).hostName or "") == "serpentine";
    liveDir = "${config.home.homeDirectory}/.local/share/spotify-shoji-live";
    fallbackColors = pkgs.writeText "spotify-rosepine.json" (builtins.toJSON {
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
    });
    liveApply = inputs.lumina.packages.${system}.spicetify-live-apply;
    spotifyApply = pkgs.writeShellApplication {
      name = "shoji-spicetify-apply";
      runtimeInputs = [liveApply];
      text = ''
        colors="''${1:-$HOME/.local/state/shoji/spotify-colors.json}"
        if [ ! -f "$colors" ]; then
          colors="${fallbackColors}"
        fi
        exec spicetify-live-apply \
          --spotify "${pkgs.spotify}/share/spotify" \
          --theme-src "${spicePkgs.themes.text.src}" \
          --theme-name "ShojiText" \
          --colors "$colors" \
          --live-dir "${liveDir}" \
          --extension "${spicePkgs.extensions.adblock.src}" "${spicePkgs.extensions.adblock.name}" \
          --extension "${spicePkgs.extensions.shuffle.src}" "${spicePkgs.extensions.shuffle.name}" \
          --patch "xpui.js_find_8008" ',(\w+=)56' \
          --patch "xpui.js_repl_8008" ',\132'
      '';
    };
    spotifyLauncher = pkgs.writeShellApplication {
      name = "spotify";
      runtimeInputs = [spotifyApply];
      text = ''
        source_path=""
        if [ -f "${liveDir}.source" ]; then
          IFS= read -r source_path < "${liveDir}.source"
        fi
        if [ ! -x "${liveDir}/spotify" ] || [ ! -d "${liveDir}/Apps" ] || [ "$source_path" != "${pkgs.spotify}/share/spotify" ]; then
          shoji-spicetify-apply
        fi
        exec "${liveDir}/spotify" "$@"
      '';
    };
  in
    if isShojiHost then {
      programs.spicetify.enable = false;

      home.packages = [
        spotifyApply
        spotifyLauncher
      ];

      xdg.desktopEntries.spotify = {
        name = "Spotify";
        genericName = "Music Player";
        exec = "${spotifyLauncher}/bin/spotify %U";
        icon = "${pkgs.spotify}/share/spotify/icons/spotify-linux-256.png";
        terminal = false;
        type = "Application";
        categories = ["AudioVideo" "Audio" "Player"];
        mimeType = ["x-scheme-handler/spotify"];
      };
    } else {
      programs.spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle
        ];
        theme = spicePkgs.themes.text;
        colorScheme = "RosePine";
      };
    };
}
