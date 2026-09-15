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
    ];
  };
}
