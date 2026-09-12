{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.matugen = {config, ...}: {
    xdg.configFile."matugen/templates/starship.toml".source = ./misc/starship-matugen.toml;
    xdg.configFile."matugen/templates/millennium.css".source = ./misc/millennium-matugen.css;

    xdg.configFile."matugen/config.toml".text = ''
      [config]

      [templates]

      [templates.starship]
      input_path = '${config.xdg.configHome}/matugen/templates/starship.toml'
      output_path = '${config.home.homeDirectory}/.config/starship.toml'

      [templates.millennium]
      input_path = '${config.xdg.configHome}/matugen/templates/millennium.css'
      output_path = '${config.home.homeDirectory}/.steam/steam/millennium/themes/Material-Theme/css/main/colors/matugen.css'
    '';
  };
}
