{
  self,
  inputs,
  ...
}: {
  flake.custom.aliceModules.packages = {pkgs, ...}: {
    home.packages = with pkgs;
      [
        antigravity-cli
        cursor-cli
        code-cursor-fhs
        nixfmt
        antigravity-ide
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
        xsettingsd
      ]
      ++ [inputs.hibiki.packages.${pkgs.stdenv.hostPlatform.system}.default];
  };
}
