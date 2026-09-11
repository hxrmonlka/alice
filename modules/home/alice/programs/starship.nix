{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.starship = {...}: {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };
  };

  flake.custom.alice.starshipMatugen = {config, ...}: {
    xdg.configFile."matugen/templates/starship.toml".source = ./misc/starship-matugen.toml;
    xdg.configFile."matugen/config.toml".text = ''
      [config]

      [templates]

      [templates.starship]
      input_path = '${config.xdg.configHome}/matugen/templates/starship.toml'
      output_path = '${config.home.homeDirectory}/.config/starship.toml'
    '';
  };
}
