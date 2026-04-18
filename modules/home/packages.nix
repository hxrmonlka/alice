{ self
, inputs
, ...
}:
{
  flake.homeModules.alicePackages =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gemini-cli
        cursor-cli
        code-cursor-fhs
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
        fish-lsp
        babelfish
        cliphist
      ];
    };
}
