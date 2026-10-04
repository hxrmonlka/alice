{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.packages = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.custom.commonModules.nixSettings
    ];
    environment.systemPackages = with pkgs; [
      wget
      nix-output-monitor
      nix-eval-jobs
      nix-fast-build
      xwayland-satellite
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg
      qt5.qtsvg
      qt5.qtimageformats
      qt5.qtmultimedia
      kdePackages.qt5compat
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
      (rust-bin.stable.latest.default.override {
        extensions = ["rust-src"];
      })
      rust-analyzer
      clippy
      rustPlatform.rustLibSrc
      deadnix
      statix
      nixpkgs-fmt
      wireplumber
      alejandra
      asciinema
      devin-cli
      nodejs_22
      clang-tools
      dgop
      ardour
      qbittorrent
      usbutils
      ani-cli
      proton-vpn
      hicolor-icon-theme
      loupe
      showtime
      glibc
      sourcekit-lsp
      openssl
      kdePackages.ark
      todoist-electron
      concord-tui
      mpv
    ];
    nixpkgs = {
      config = {
        allowUnfree = lib.mkForce true;
      };
    };
  };
}
