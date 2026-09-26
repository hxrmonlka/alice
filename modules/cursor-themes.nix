{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.cursorThemes = {
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
        cp -r AriaCursor $out/share/icons/
        cp -r YeShunguang $out/share/icons/
        runHook postInstall
      '';

      meta = {
        description = "Cursor themes from resources repository";
      };
    };
  };
}
