{lib, ...}: {
  options.flake.custom.hardwareModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.unspecified;
    default = {};
    description = "Hardware modules from ./modules/hardware.";
  };
}
