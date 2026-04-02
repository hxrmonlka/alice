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
  ];

  programs.caelestia-dots = {
    enable = true;
    hypr.enable = true;
    editor.enable = true;
    term.enable = true;
    btop.enable = true;
    foot.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
