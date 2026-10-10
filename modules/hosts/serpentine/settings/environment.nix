{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.environment = {
    pkgs,
    lib,
    ...
  }: {
    environment = {
      shellAliases = {
        at-world = "nix flake update; nh os boot";
        build = "nh os switch";
      };
      shells = [
        pkgs.zsh
      ];
    };
  };
}
