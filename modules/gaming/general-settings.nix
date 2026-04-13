{ self, inputs, ... }:
{
  flake.nixosModules.gamingSettings =
    { pkgs, ... }:
    {
      services.xserver.desktopManager.retroarch = {
        enable = true;
      };
      environment.systemPackages = with pkgs; [
        mangohud
        goverlay
        protonup-qt
        protonplus
        lutris

        # literal games are here.
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-lazer-bin
      ];

      programs.steam = {
        enable = true;
        protontricks.enable = true;
        gamescopeSession = {
          enable = true;
        };
      };
      programs.gamemode = {
        enable = true;
      };
    };
}
