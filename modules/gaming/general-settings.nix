{ self
, inputs
, ...
}:
{
  flake.nixosModules.gamingSettings = { pkgs, ... }: {
    services.xserver.desktopManager.retroarch = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      mangohud
      goverlay
      protonup-qt
      protonplus
      lutris
      umu-launcher
    ];
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession = {
        enable = true;
      };
      package = pkgs.millennium-steam;
    };
    programs.gamemode = {
      enable = true;
    };
  };
}
