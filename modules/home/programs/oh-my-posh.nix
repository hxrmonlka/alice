{
  self,
  inputs,
  ...
}: {
  flake.homeModules.aliceOmp = {...}: {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "peru";
      enableZshIntegration = true;
    };
  };
}
