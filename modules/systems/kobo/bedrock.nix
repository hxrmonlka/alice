{inputs, ...}: {
  flake.custom.system-modules.kobo-bedrock = inputs.lumina.lib.bedrock.mkModule {
    optionPath = ["kobo" "bedrock"];
    confFile = ".config/kobo/bedrock.conf";
    hostStratum = "debian";
    strata = ["debian" "void" "gentoo"];
    pins = {
      sway = "void";
      swaymsg = "void";
      swaybg = "void";
      swaylock = "void";
    };
    init = {
      stratum = "gentoo";
      system = "openrc";
      path = "/sbin/init";
      timeout = 10;
    };
  };
}
