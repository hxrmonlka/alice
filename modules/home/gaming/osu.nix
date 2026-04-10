{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceGamingConfig =
    { pkgs, ... }:
    {
      # TODO: separate GitHub repo for "resources"
      home.packages = [
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
      ];
    };
}
