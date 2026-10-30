{
  self,
  inputs,
  ...
}: {
  flake.custom.commonModules.nixSettings = {pkgs, ...}: {
    nixpkgs = {
      config = {
        allowUnfree = false;
        permittedInsecurePackages = [
          "electron-39.8.10"
        ];
      };
      overlays = [
        inputs.nix-cachyos-kernel.overlays.pinned
        inputs.rust-overlay.overlays.default
        inputs.millennium.overlays.default
        (final: prev: {
          openldap = prev.openldap.overrideAttrs {doCheck = false;};
        })
        (final: prev: {
          breakpad = inputs.lumina.lib.patches.breakpad prev.breakpad;
        })
        (final: prev: {
          lazarus-qt6 = prev.lazarus-qt6.overrideAttrs (old: {
            postInstall = let
              ldFlags = ''$(echo "$NIX_LDFLAGS" | sed -re 's/-rpath [^ ]+//g' | tr -s ' ' | sed -re 's/(^ *| *$)//g')'';
            in ''
              wrapProgram $out/bin/startlazarus \
                --prefix NIX_LDFLAGS ' ' "${ldFlags}" \
                --prefix NIX_LDFLAGS_${prev.binutils.suffixSalt} ' ' "${ldFlags}" \
                --prefix LCL_PLATFORM ' ' "$LCL_PLATFORM" \
                --prefix PATH ':' "${prev.lib.makeBinPath [prev.fpc prev.gdb prev.gnumake prev.binutils]}"
            '';
          });
        })
        (final: prev: {
          khal =
            if prev.khal.version == "0.14.1"
            then
              prev.khal.overrideAttrs {
                sphinxBuilders = [
                  "html man"
                ];
              }
            else prev.khal;
        })
      ];
    };
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        fallback = true;
        substituters = [
          "https://cache.lantian.pub/lantian"
          "https://noctalia.cachix.org"
        ];
        trusted-public-keys = [
          "lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };
    };
  };
}
