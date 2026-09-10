{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.programs = {pkgs, ...}: {
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
