{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.gamingOverride = {
    pkgs,
    lib,
    ...
  }: {
    imports = [self.nixosModules.gamingSettings];

    programs.steam.package = lib.mkForce pkgs.millennium-steam;

    home-manager.users.alice = {
      xdg.configFile = {
        "matugen/millennium.css".text = ''
          :root {
              --theme-color: "Matugen";
              --hue-rotate: 220deg;
              <* for name, value in colors *>
              --md-sys-color-{{name | replace: "_", "-" }}: {{value.default.rgb}};
              <* endfor *>
          }
        '';

        "matugen/config.toml".text = ''
          [config]

          [templates.millennium]
          input_path = '/home/alice/.config/matugen/millennium.css'
          output_path = '~/.steam/steam/millennium/themes/Material-Theme/css/main/colors/matugen.css'
        '';
      };
    };
  };
}
