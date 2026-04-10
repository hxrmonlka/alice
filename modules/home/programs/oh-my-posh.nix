{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceProgramsConfig =
    { ... }:
    {
      programs.oh-my-posh = {
        enable = true;
        useTheme = "peru";
        enableZshIntegration = true;
      };
    };
}
