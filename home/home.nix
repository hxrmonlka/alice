{ config, pkgs, ... }:

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

# starship.toml from upstream caelestia-dots
  xdg.configFile."starship.toml".source =
    "${inputs.caelestia-nixos.inputs.caelestia-dots}/starship/starship.toml";
  
  # fish: the upstream config is literally just these two things
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
  
  # eza aliases (standard ones caelestia-nixos generates)
  programs.fish.shellAliases = {
    ls  = "eza";
    ll  = "eza -lh";
    la  = "eza -lah";
    lt  = "eza --tree";
    # add more as desired
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
