{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.zsh-sys-level = _: {
    programs.zsh.enable = true;
  };
  flake.custom.alice.shells = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      nushell = {
        enable = true;
        shellAliases = {
          ll = "ls -l";
          ex = "eza --icons";
          lstree = "eza --icons --tree";
          jj = "lazygit";
          quit = "exit";
          cd = "z";
        };
        settings = {
          show_banner = false;
        };
      };
      fish = {
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
          echo ">>> ls is replaced by eza."
        '';
      };
      zsh = {
        enable = true;
        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        setOptions = [
          "CORRECT"
        ];
        defaultKeymap = "viins";
        initContent = lib.mkOrder 1000 ''
          echo ">>> Current mode: $SHELL"
        '';
        shellAliases = {
          ll = "ls -l";
          ex = "eza --icons";
          lstree = "eza --icons --tree";
          jj = "lazygit";
          quit = "exit";
          cd = "z";
        };
      };
      zoxide = {
        enable = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };
    };
  };
}
