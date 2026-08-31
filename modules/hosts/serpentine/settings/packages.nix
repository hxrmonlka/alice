{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentinePackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wget
      nix-output-monitor
      nix-eval-jobs
      nix-fast-build
      xwayland-satellite
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNiriPkg
      self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
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
    ];
  };
}
