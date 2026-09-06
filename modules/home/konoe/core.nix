{
  self,
  inputs,
  ...
}: {
  flake.homeModules.konoeCore = {
    pkgs,
    lib,
    config,
    ...
  }: {
    home.username = "konoe";
    home.homeDirectory = "/home/konoe";
    home.sessionPath = ["${config.home.homeDirectory}/.local/bin"];

    home.stateVersion = "26.05";
  };
}
