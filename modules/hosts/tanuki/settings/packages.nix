{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git
      neovim
      git
      discord
      protonup-qt
      lutris
    ];
  };
}
