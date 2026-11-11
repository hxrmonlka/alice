{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.zsh-sys-level = _: {
    programs.zsh = {
      enable = true;
      promptInit = ''
        nitch
      '';
    };
  };
  flake.custom.alice.shells = {
    pkgs,
    lib,
    ...
  }: {
    home.shellAliases = {
      # Global shell aliases, I guess.
      jj = "lazygit";
      quit = "exit";
      cd = "z";
      cat = "${lib.getExe pkgs.bat}";
      at-world = "nh os boot --update";
      nbuild = "nh os switch";
      ngarb = "nh clean all --keep 3";
      ga = "git add .";
      gp = "git push";
      anic = "ani-cli -c";
    };
    programs = {
      nushell = {
        enable = true;
        loadSessionVariables = true;
        environmentVariables.CARAPACE_BRIDGES = "zsh,fish,bash";
        settings = {
          show_banner = false;
          highlight_resolved_externals = true;
        };
        extraConfig = ''
          print ">>> Current mode: nushell"
          print ">>> ls is replaced by eza."

          nitch
        '';
      };
      carapace = {
        enable = true;
        enableNushellIntegration = true;
        enableFishIntegration = false;
        enableZshIntegration = false;
        enableBashIntegration = false;
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
          nitch
        '';
        shellAliases = {
          ll = "ls -l";
          ls = "eza --icons=always";
          lstree = "eza --icons=always --tree";
        };
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
          ll = "ls -l";
          ls = "eza --icons=always";
          lstree = "eza --icons=always --tree";
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
