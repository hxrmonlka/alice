{
  withSystem,
  self,
  inputs,
  ...
}: {
  flake.custom.alice.core = {config, ...}: {
    home = {
      username = "alice";
      homeDirectory = "/home/alice";
      sessionPath = ["${config.home.homeDirectory}/.local/bin"];
    };

    home.stateVersion = "26.05";
  };
}
