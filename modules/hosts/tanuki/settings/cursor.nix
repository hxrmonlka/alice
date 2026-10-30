{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.tanuki-cursors = pkgs.stdenvNoCC.mkDerivation {
      pname = "tanuki-cursors";
      version = "1.0";

      src = inputs.tanuki-cursors;

      installPhase = ''
        runHook preInstall
        mkdir -p $out/share/icons
        cp -r BlueNeonGlass $out/share/icons/
        runHook postInstall
      '';

      meta.description = "BlueNeonGlass cursor theme for tanuki";
    };
  };

  flake.custom.tanuki.cursor = {pkgs, ...}: {
    home.pointerCursor = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.tanuki-cursors;
      name = "BlueNeonGlass";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
