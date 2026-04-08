{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wget
      nix-output-monitor
      nh
      nix-eval-jobs
      nix-fast-build
      lazygit
      git
      gh
      github-desktop
      niri
      xwayland-satellite
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      libsForQt5.qt5.qtsvg
      libsForQt5.qt5.qtimageformats
      libsForQt5.qt5.qtmultimedia
      kdePackages.qt5compat
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      # nvimdots build tools
      gcc
      gnumake
      cmake
      pkg-config
      unzip
      lua-language-server
      stylua
      nil
      prettier
      go
      python3
      rust-bin.stable.latest.default
      # will work on this later.
      deadnix
      statix
      nixpkgs-fmt
      nixfmt
      wireplumber
    ];
    nixpkgs = {
      config.allowUnfree = true;
      overlays = with inputs; [
        nix-cachyos-kernel.overlays.pinned
        rust-overlay.overlays.default
      ];
    };
    nix = {
      settings = {
        substituters = [
          "https://attic.xuyh0120.win/lantian"
        ];
        trusted-public-keys = [
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };
    };
  };
}
