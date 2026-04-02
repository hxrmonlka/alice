{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    generateCompletions = true;
    shellAbbrs = {
      ls = "eza --icons";
    };
  };
}
