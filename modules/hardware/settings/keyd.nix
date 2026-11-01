{
  self,
  inputs,
  ...
}: {
  flake.custom.hardwareModules.keydSettings = {
    config,
    lib,
    pkgs,
    ...
  }: let
    cfg = config.hardware.keyd;

    dashed = id: builtins.replaceStrings [":"] ["-"] id;

    confName = id: "keyd/disabled-${dashed id}.conf";

    mkDisabledConf = id:
      pkgs.runCommand "keyd-disabled-${dashed id}.conf" {} ''
        printf '[ids]\n\n%s\n\n[main]\n\n' '${id}' > $out
        ${config.services.keyd.package}/bin/keyd list-keys \
          | grep -vE '[A-Z!#$%&()*+:<>?@^_{|}~]' \
          | LC_ALL=C sort -u \
          | awk '{ print $1 " = noop" }' >> $out
      '';
  in {
    options.hardware.keyd.disabledKeyboards = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      example = ["0001:0001"];
      description = "keyd device ids fully disabled by binding every valid key to noop.";
    };

    config = lib.mkIf (cfg.disabledKeyboards != []) {
      services.keyd.enable = true;

      environment.etc = lib.listToAttrs (map (id:
        lib.nameValuePair (confName id) {
          source = mkDisabledConf id;
        })
      cfg.disabledKeyboards);

      systemd.services.keyd.restartTriggers = map (id: config.environment.etc.${confName id}.source) cfg.disabledKeyboards;
    };
  };
}
