{
  self,
  inputs,
  ...
}: {
  flake.nixosModule.tanukiPrograms = {pkgs, ...}: {
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
