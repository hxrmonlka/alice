{
  self,
  inputs,
  ...
}: {
  flake.custom.ekpyrosis.environment = {
    pkgs,
    lib,
    ...
  }: {
    environment = {
      shellAliases = {
        at-world = "nix flake update && nh os boot";
        nbuild = "nh os switch";
      };
      shells = [
        pkgs.nushell
      ];
    };
  };
}
