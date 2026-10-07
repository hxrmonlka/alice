{...}: {
  flake.custom.system-modules.kobo-bedrock = {
    config,
    lib,
    ...
  }: let
    cfg = config.kobo.bedrock;

    pinLines =
      lib.mapAttrsToList
      (cmd: stratum: "pin/bin/${cmd} = ${stratum}:/usr/bin/${cmd}")
      cfg.pins;
  in {
    options.kobo.bedrock = {
      hostStratum = lib.mkOption {
        type = lib.types.str;
        default = "debian";
      };

      strata = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = ["debian" "void" "gentoo"];
      };

      pins = lib.mkOption {
        type = lib.types.attrsOf lib.types.str;
        default = {};
      };
    };

    config = {
      kobo.bedrock.pins = {
        sway = lib.mkDefault "void";
        swaymsg = lib.mkDefault "void";
        swaybg = lib.mkDefault "void";
        swaylock = lib.mkDefault "void";
      };

      assertions = [
        {
          assertion = lib.all (s: lib.elem s cfg.strata) (lib.attrValues cfg.pins);
          message = "kobo.bedrock.pins references a stratum missing from kobo.bedrock.strata";
        }
      ];

      home.file.".config/kobo/bedrock-pins.conf".text =
        ''
          [cross-bin]
        ''
        + lib.concatStringsSep "\n" pinLines
        + "\n";
    };
  };
}
