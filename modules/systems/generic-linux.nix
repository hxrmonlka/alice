{inputs, ...}: {
  flake.custom.system-modules.generic-linux = {
    lib,
    ...
  }: {
    targets.genericLinux.enable = true;

    home.sessionVariables = {
      NIXGL_HOST = lib.mkDefault "mesa";
    };

    home.packages = [
      inputs.nixgl.packages.x86_64-linux.nixGL
    ];
  };
}
