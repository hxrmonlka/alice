{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.aliceProgramsZsh =
    { pkgs, ... }:
    {
      programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        shellAliases = {
          ll = "ls -l";
          ls = "eza --icons";
          lstree = "eza --icons --tree";
          ols = "/run/current-system/sw/bin/ls";
          jj = "lazygit";
          quit = "exit";
        };
      };
    };
}
