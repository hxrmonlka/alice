{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceShells = {
    pkgs,
    lib,
    ...
  }: {
    programs.nushell = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        ls = "eza --icons";
        lstree = "eza --icons --tree";
        ols = lib.getExe' pkgs.coreutils "ls";
        jj = "lazygit";
        quit = "exit";
        cd = "z";
      };
      settings = {
        show_banner = false;
      };
    };
    programs.fish = {
      enable = true;
      shellAbbrs = {
        ll = "ls -l";
        ls = "eza --icons";
        lstree = "eza --icons --tree";
        ols = lib.getExe' pkgs.coreutils "ls";
        jj = "lazygit";
        quit = "exit";
        cd = "z";
      };
      generateCompletions = true;
      interactiveShellInit = ''
        set fish_greeting
      '';
    };
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      initContent = lib.mkOrder 1000 ''
        fastfetch
      '';
      shellAliases = {
        ll = "ls -l";
        ls = "eza --icons";
        lstree = "eza --icons --tree";
        ols = lib.getExe' pkgs.coreutils "ls";
        jj = "lazygit";
        quit = "exit";
        cd = "z";
      };
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
