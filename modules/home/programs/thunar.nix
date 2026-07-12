{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.thunar = {pkgs, ...}: {
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        xfce.thunar-archive-plugin
        xfce.thunar-media-tags-plugin
        xfce.thunar-vcs-plugin
        thunar-shares-plugin
        xfce.thunar-volman
      ];
    };
  };
}
