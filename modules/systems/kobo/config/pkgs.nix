{
  self,
  inputs,
  ...
}: {
  flake.custom.kobo.home-pkgs = {pkgs, ...}: {
    home.packages = with pkgs; [
      lazygit
      nixd
      alejandra
      inputs.lumina.packages.${system}.chatgpt
    ];
  };
}
