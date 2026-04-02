{ ... }: {
  imports = [
    ./features/niri-config.nix
    ./features/noctalia/noctalia-config.nix
    ./features/wlr-which-key/wlr-which-key-config.nix
    ./features/quickshell/quickshell-config.nix
  ];
};
