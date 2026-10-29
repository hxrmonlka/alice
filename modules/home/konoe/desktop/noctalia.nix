{inputs, ...}: {
  flake.custom.konoe.noctalia = {...}: {
    xdg.configFile."noctalia/launcher.toml".text = ''
      [shell]
      launch_apps_custom_command = "nvidia-offload $CMD"
    '';
  };

  perSystem = {system, ...}: {
    packages.konoeNoctalia = inputs.noctalia.packages.${system}.default;
  };
}
