{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.serpentineEnvironment =
    {
      pkgs,
      lib,
      ...
    }:
    {
      environment = {
        shells = [
          pkgs.zsh
        ];
      };
    };
}
