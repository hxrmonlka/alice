{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceGamingOsu =
    { pkgs, ... }:
    {
      # TODO: separate GitHub repo for "resources"
      home.packages = [
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
      ];
    };
}
