{ self, inputs, ... }:
{
  flake.homeModules.aliceProgramsSpotify =
    { inputs, pkgs, ... }:
    {
      programs.spicetify =
        let
          spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
        in
        {
          enable = true;
          enabledExtensions = with spicePkgs.extensions; [
            adblock
            shuffle
          ];
          theme = spicePkgs.themes.text;

          customColorScheme = {
            accent = "df2d52";
            accent-active = "df2d52";
            accent-inactive = "987a81";
            banner = "df2d52";
            border-active = "df2d52";
            border-inactive = "564448";
            header = "feedf3";
            highlight = "423034";
            main = "2a2124";
            notification = "df2d52";
            notification-error = "f6661e";
            subtext = "987a81";
            text = "feedf3";

            sidebar = "2a2124";
            player = "2a2124";
            card = "423034";
            shadow = "1a1517";
            selected-row = "423034";
            button = "df2d52";
            button-active = "df2d52";
            button-disabled = "564448";
            tab-active = "423034";
            misc = "2a2124";
          };
        };
    };
}
