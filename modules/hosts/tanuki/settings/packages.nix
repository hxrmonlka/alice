{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
      neovim
      discord
      protonup-qt
      lutris
      alejandra
      nixfmt
      self.packages.${pkgs.stdenv.hostPlatform.system}.konoeNoctalia
      inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.sklauncher
    ];
  };
}
