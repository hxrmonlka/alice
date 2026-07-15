{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.aria-cursor = pkgs.stdenvNoCC.mkDerivation {
      pname = "aria-cursor";
      version = "1.0";

      src = inputs.aria-cursor;

      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/icons/AriaCursor
        cp -r * $out/share/icons/AriaCursor/
        runHook postInstall
      '';

      meta = {
        description = "Aria cursor theme";
      };
    };
  };
}
