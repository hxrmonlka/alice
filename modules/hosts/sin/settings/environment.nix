{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinEnvironment = {pkgs, ...}: {
    environment = {
      shells = [
        pkgs.zsh
      ];
    };
  };
}
