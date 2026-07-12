{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.alicePackages = {pkgs, ...}: {
    home.packages = with pkgs; [
      gemini-cli
      antigravity-cli
      cursor-cli
      code-cursor-fhs
      nixfmt
      antigravity
      starship
      eza
      libnotify
      grim
      grimblast
      slurp
      wl-clipboard
      swappy
      pavucontrol
      wlr-randr
      wlr-which-key
      fish-lsp
      babelfish
      cliphist
      # note taking apps
      anki-bin
      affine-bin
    ];
  };
}
