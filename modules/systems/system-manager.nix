{inputs, ...}: {
  flake.custom.system-modules.system-manager = {
    system-manager,
    ...
  }: {
    imports = [
      system-manager.systemModules.default
    ];
  };
}
