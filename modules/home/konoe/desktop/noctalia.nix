{inputs, ...}: {
  flake.custom.konoe.noctalia = {...}: {
    xdg.configFile."noctalia/config.toml".source = ./noctalia.toml;
  };

  perSystem = {system, ...}: {
    packages.konoeNoctalia = inputs.noctalia.packages.${system}.default;
  };
}
