{ self
, inputs
, ...
}:
{
  flake.homeModules.aliceProgramsZsh =
    { pkgs, lib, ... }:
    {
      programs.zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        initContent = lib.mkOrder 1000 ''
          export PF_INFO="ascii os kernel uptime pkgs memory"
          pfetch
        '';
        shellAliases = {
          ll = "ls -l";
          ls = "eza --icons";
          lstree = "eza --icons --tree";
          ols = "/run/current-system/sw/bin/ls";
          jj = "lazygit";
          quit = "exit";
        };
      };
      home.packages = [ pkgs.pfetch ];
    };
}
