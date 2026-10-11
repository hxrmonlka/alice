{inputs, ...}: {
  flake.custom.serpentine.fonts = {pkgs, ...}: {
    fonts.packages = [
      inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.libron-font
    ];
  };
}
