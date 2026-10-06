{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: let
    pinned = inputs.nixpkgs-pinned.legacyPackages.${system};
    patched = pkgs.extend (_: _: {
      inherit (pinned) noctalia-qs noctalia-shell;
    });
  in {
    packages.konoeNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      pkgs = patched;
      settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
      outOfStoreConfig = "/home/konoe/.config/noctalia";

      user-templates.templates = let
        templates = "${patched.noctalia-shell}/share/noctalia-shell/Assets/Templates";
        themes = "~/.var/app/dev.vencord.Vesktop/config/vesktop/themes";
      in {
        vesktop_flatpak_midnight = {
          input_path = "${templates}/discord-midnight.css";
          output_path = "${themes}/noctalia.theme.css";
        };
        vesktop_flatpak_material = {
          input_path = "${templates}/discord-material.css";
          output_path = "${themes}/noctalia-material.theme.css";
        };
      };
    };
  };
}
