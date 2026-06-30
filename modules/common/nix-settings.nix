{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.nixSettings = {pkgs, ...}: {
    nixpkgs = {
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-39.8.10"
        ];
      };
      overlays = [
        inputs.nix-cachyos-kernel.overlays.pinned
        inputs.rust-overlay.overlays.default
        (final: prev: {
          openldap = prev.openldap.overrideAttrs {doCheck = false;};
        })
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
