{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    gemini-cli
    nixfmt
    antigravity
    starship
    eza
  ];

  programs.caelestia-dots = {
    enable = true;
    hypr.enable = true;
    editor.enable = true;
    term.enable = false;
    btop.enable = true;
    foot.enable = true;
  };

  xdg.configFile."starship.toml".source =
    "${inputs.caelestianix.inputs.caelestia-dots}/starship/starship.toml";
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
    functions = {
      mark_prompt_start = {
        onEvent = "fish_prompt";
        body = ''echo -en "\e]133;A\e\\"'';
      };
    };
  };
  
  programs.fish.shellAliases = {
    ls  = "eza";
    ll  = "eza -lh";
    la  = "eza -lah";
    lt  = "eza --tree";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
