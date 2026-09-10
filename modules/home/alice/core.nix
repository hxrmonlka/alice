{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.core = {
    pkgs,
    lib,
    config,
    ...
  }: {
    home.username = "alice";
    home.homeDirectory = "/home/alice";
    home.sessionPath = ["${config.home.homeDirectory}/.local/bin"];

    home.stateVersion = "26.05";
  };
}
