{
  self,
  inputs,
  ...
}: {
  flake.custom.alice.starship = {...}: {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };
  };
}
