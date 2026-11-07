{...}: {
  flake.custom.alice.matugen = {config, ...}: {
    xdg.configFile."matugen/templates/starship.toml".source = ./misc/starship-matugen.toml;
    xdg.configFile."matugen/templates/millennium.css".source = ./misc/millennium-matugen.css;
    xdg.configFile."matugen/templates/nushell.nu".source = ./misc/nushell-matugen.nu;
    xdg.configFile."nushell/autoload/.keep".text = "";

    xdg.configFile."matugen/config.toml".text = ''
      [config]

      [templates]

      [templates.starship]
      input_path = '${config.xdg.configHome}/matugen/templates/starship.toml'
      output_path = '${config.home.homeDirectory}/.config/starship.toml'

      [templates.nushell]
      input_path = '${config.xdg.configHome}/matugen/templates/nushell.nu'
      output_path = '${config.xdg.configHome}/nushell/autoload/matugen-theme.nu'

      [templates.millennium]
      input_path = '${config.xdg.configHome}/matugen/templates/millennium.css'
      output_path = '${config.home.homeDirectory}/.steam/steam/millennium/themes/Material-Theme/css/main/colors/matugen.css'
    '';

    home.file.".steam/steam/millennium/themes/Material-Theme/js/main/colors/matugen.js" = {
      source = ./misc/millennium-matugen.js;
      force = true;
    };
  };
}
