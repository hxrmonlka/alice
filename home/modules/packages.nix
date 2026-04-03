{ pkgs, ... }: {
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
}
