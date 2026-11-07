{lib, ...}: {
  options.flake.custom.commonModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.unspecified;
    default = {};
    description = "Shared NixOS modules from ./modules/common.";
  };
}
