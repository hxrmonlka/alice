{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.packages = {pkgs, ...}: {
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
