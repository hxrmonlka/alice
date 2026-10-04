{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.konoeNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;

      user-templates.templates = let
        templates = "${pkgs.noctalia-shell}/share/noctalia-shell/Assets/Templates";
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
