# Rename this file to shells.nix soon because it will
# contain the following shells:
# fish, nushell.
{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceZsh = {
    pkgs,
    lib,
    ...
  }: {
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
        cd = "z";
      };
    };
    home.packages = with pkgs; [
      pfetch
    ];
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
