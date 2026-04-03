{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/index.nix
  ];
  home.username = "alice";
  home.homeDirectory = "/home/alice";

  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
