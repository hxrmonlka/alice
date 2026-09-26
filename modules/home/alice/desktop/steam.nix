# Has been unused since day 2 because Mango solves this exact problem.
{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.steamFix = {
    pkgs,
    lib,
    ...
  }: {
    xdg.desktopEntries.steam = {
      name = "Steam";
      genericName = "Gaming Platform";
      comment = "Wrapped in gamescope to work around xwayland-satellite popup mislocation under niri";
      exec = "${lib.getExe pkgs.gamescope} -e -b -- steam %U";
      icon = "steam";
      terminal = false;
      categories = ["Network" "FileTransfer" "Game"];
      mimeType = ["x-scheme-handler/steam" "x-scheme-handler/steamlink"];
      noDisplay = false;
    };
  };
}
