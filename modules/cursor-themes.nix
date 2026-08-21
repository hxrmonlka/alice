{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.cursorThemes = {
    pkgs,
    lib,
    ...
  }: {};
  perSystem = {pkgs, ...}: {
    packages.cursor-themes = pkgs.stdenvNoCC.mkDerivation {
      pname = "cursor-themes";
      version = "1.0";

      src = inputs.cursor-themes;

      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/icons
        cp -r * $out/share/icons/
        runHook postInstall
      '';

      meta = {
        description = "Cursor themes from resources repository";
      };
    };
  };
}