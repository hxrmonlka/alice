{inputs, ...}: {
  flake.custom.konoe.noctalia = {...}: {
    xdg.configFile."noctalia/noctalia.toml".source = ./noctalia.toml;
  };

  perSystem = {system, ...}: {
    packages.konoeNoctalia = inputs.noctalia.packages.${system}.default;
  };
}
