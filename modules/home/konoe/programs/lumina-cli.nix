{inputs, ...}: {
  flake.custom.konoe.luminaCli = {config, ...}: {
    imports = [inputs.lumina.homeModules.lumina-cli];

    programs.lumina-cli = {
      enable = true;
      configPath = "${config.home.homeDirectory}/.local/alice";
    };
  };
}
