{inputs, ...}: {
  flake.custom.alice.shoji = {...}: {
    imports = [inputs.shoji.homeManagerModules.default];
    programs.shoji = {
      enable = true;
      cli.enable = true;
      config.enable = true;
      greeterSync.enable = true;
    };
  };
}
