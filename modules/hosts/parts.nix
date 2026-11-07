{lib, ...}: {
  options.flake.custom = {
    tanuki = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
      description = "System-level namespace for Tanuki.";
    };

    ekpyrosis = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
      description = "System-level namespace for Ekpyrosis.";
    };
  };
}
