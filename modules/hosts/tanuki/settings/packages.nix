{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.packages = {
    pkgs,
    lib,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      git
      neovim
      vesktop
      protonup-qt
      lutris
      alejandra
      nixfmt
      self.packages.${pkgs.stdenv.hostPlatform.system}.konoeNoctalia
      inputs.lumina.packages.${pkgs.stdenv.hostPlatform.system}.sklauncher
    ];
    nixpkgs.config.allowUnfree = lib.mkForce true;
  };
}
