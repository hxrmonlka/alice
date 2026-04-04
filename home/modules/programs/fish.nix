{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAbbrs = {
      ls = "eza --icons";
      quit = "exit";
      lsm = "/run/current-system/sw/bin/ls";
    };
  };
}
