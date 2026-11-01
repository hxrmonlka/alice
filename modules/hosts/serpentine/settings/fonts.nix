{inputs, ...}: {
  flake.custom.serpentine.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      inputs.lumina.packages.${stdenv.hostPlatform.system}.libron-font
      material-symbols
    ];
  };
}
