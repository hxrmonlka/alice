{inputs, ...}: {
  flake.custom.ekpyrosis.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      inputs.lumina.packages.${stdenv.hostPlatform.system}.libron-font
      inputs.lumina.packages.${stdenv.hostPlatform.system}.google-sans-flex-font
      material-symbols
    ];
  };
}
