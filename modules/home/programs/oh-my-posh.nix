{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceProgramsOmp =
    { ... }:
    {
      programs.oh-my-posh = {
        enable = true;
        useTheme = "peru";
        enableZshIntegration = true;
      };
    };
}
