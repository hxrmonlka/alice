{lib, ...}: {
  options = {
    flake.homeModules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified;
      default = {};
    };

    flake.custom = {
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

      commonModules = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.unspecified;
        default = {};
        description = "Shared NixOS modules from ./modules/common.";
      };

      hardwareModules = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.unspecified;
        default = {};
        description = "Hardware modules from ./modules/hardware.";
      };
    };
  };

  config.systems = [
    "x86_64-linux"
    "x86_64-darwin"
    "aarch64-linux"
    "aarch64-darwin"
  ];
}
