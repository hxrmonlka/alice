{lib, ...}: {
  options.flake.custom.system-modules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.unspecified;
    default = {};
    description = "System modules from ./modules/systems, for other Linux machines using Alice.";
  };

  options.flake.custom.kobo = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.unspecified;
    default = {};
    description = "dedicated modules in kobo";
  };
}
