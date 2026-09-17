{
  self,
  inputs,
  ...
}: {
  flake.custom.aux-mini.programs = {pkgs, ...}: {
    programs = {
      hyprland = {
        enable = true;
      };
      waybar = {
        enable = true;
      };
    };
  };
}
