{
  self,
  inputs,
  ...
}: {
  flake.custom.aux-mini.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      foot
      git
      wget
    ];
  };
}
