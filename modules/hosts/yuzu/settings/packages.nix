{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.yuzuPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wget
      neovim
      git
    ];
  };
}
