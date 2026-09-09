{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiPrograms = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
      };
      niri = {
        enable = true;
      };
      appimage = {
        enable = true;
        binfmt = true;
      };
    };
  };
}
