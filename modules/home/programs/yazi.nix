# modules/home/programs/yazi.nix
{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceYazi = {pkgs, ...}: {
    programs.yazi = {
      enable = true;
      shellWrapperName = "y";
      enableZshIntegration = true;
      settings.theme.flavor.use = "noctalia";
    };
  };
}
