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
      shells = [
        pkgs.zsh
      ];
    };
  };
}
