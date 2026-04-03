{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/index.nix
  ];
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
    waybar
    swaybg
    libnotify
    mako
    grim
    slurp
    wl-clipboard
    swappy
    pavucontrol
    wlr-randr
    wlr-which-key
    quickshell
    zoxide
    fish-lsp
    babelfish
    github-desktop
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
