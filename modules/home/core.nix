{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceCore = {
    pkgs,
    lib,
    ...
  }: {
    home.username = "alice";
    home.homeDirectory = "/home/alice";

    home.stateVersion = "26.05";
  };
}
