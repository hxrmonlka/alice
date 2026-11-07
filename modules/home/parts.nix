{lib, ...}: {
  options.flake = {
    homeModules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
    };

    custom = {
      konoe = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.unspecified;
        default = {};
        description = "Konoe's dedicated homeModules from ./modules/home/konoe.";
      };

      alice = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.unspecified;
        default = {};
        description = "Alice's dedicated homeModules from ./modules/home/alice.";
      };

      home-common = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.unspecified;
        default = {};
        description = "Shared NixOS modules from ./modules/common/home.";
      };
    };
  };
}
