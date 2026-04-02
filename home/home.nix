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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
