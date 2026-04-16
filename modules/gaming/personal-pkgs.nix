{ self, inputs, ... }:
{
  flake.nixosModules.games =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
      ];
    };
}
