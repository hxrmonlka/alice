{ self
, inputs
, ...
}:
{
  flake.nixosModules.sinPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wget
        nix-output-monitor
        nh
        nix-eval-jobs
        nix-fast-build
        xwayland-satellite
        inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
        self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg
        self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        libsForQt5.qt5.qtsvg
        libsForQt5.qt5.qtimageformats
        libsForQt5.qt5.qtmultimedia
        kdePackages.qt5compat
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
          experimental-features = [
            "nix-command"
            "flakes"
          ];
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
