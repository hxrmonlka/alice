{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.core = {config, ...}: {
    home = {
      username = "alice";
      homeDirectory = "/home/alice";
      sessionPath = ["${config.home.homeDirectory}/.local/bin"];
      sessionVariables = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
      };
    };

    home.stateVersion = "26.05";
  };
}
