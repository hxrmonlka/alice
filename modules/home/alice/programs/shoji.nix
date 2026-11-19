{inputs, ...}: {
  flake.custom.alice.shoji = {...}: {
    imports = [inputs.lumina.homeModules.shoji];

    programs.shoji = {
      enable = true;
      cli.enable = true;
      config.enable = true;
    };
  };
}
