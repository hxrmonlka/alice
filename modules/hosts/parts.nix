{lib, ...}: {
  options.flake.custom = {
    tanuki = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
      description = "System-level namespace for Tanuki.";
    };

    serpentine = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
      description = "System-level namespace for Serpentine.";
    };

    ekspyrosis = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
      description = "System-level namespace for Ekspyrosis.";
    };
  };
}
