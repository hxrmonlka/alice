{inputs, ...}: {
  flake.custom.alice.luminaCli = {config, ...}: {
    imports = [inputs.lumina.homeModules.lumina-cli];

    programs.lumina-cli = {
      enable = true;
      configPath = "${config.home.homeDirectory}/alice";
    };
  };
}
