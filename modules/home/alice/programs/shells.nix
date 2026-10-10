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
    home.sessionVariables = {
      # Global shell aliases, I guess.
      ll = "ls -l";
      ex = "eza --icons=always";
      lstree = "eza --icons=always --tree";
      jj = "lazygit";
      quit = "exit";
      cd = "z";
    };
    programs = {
      nushell = {
        enable = true;
        settings = {
          show_banner = false;
        };
      };
      fish = {
        enable = true;
        shellAbbrs = {
          ols = lib.getExe' pkgs.coreutils "ls";
        };
        generateCompletions = true;
        interactiveShellInit = ''
          set fish_greeting
          echo ">>> Current mode: fish"
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
          echo ">>> Current mode: zsh"
          echo ">>> ls is replaced by eza."
        '';
        shellAliases = {
          nd = "nix develop -c zsh";
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
