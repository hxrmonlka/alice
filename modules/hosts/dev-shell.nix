{inputs, ...}: {
  perSystem = {pkgs, ...}: let
    build-vm = pkgs.writeShellScriptBin "build-vm" ''
      set -euo pipefail

      host="''${1:-}"

      if [[ -z "$host" ]]; then
        echo "Usage: build-vm <host>"
        echo ""
        echo "Available hosts:"
        nix eval --raw .#nixosConfigurations --apply 'builtins.concatStringsSep "\n" (builtins.attrNames)' 2>/dev/null \
          | sed 's/^/  /' || echo "  (run inside the flake root to list)"
        exit 1
      fi

      echo "==> Building VM for host: $host"
      nix build ".#nixosConfigurations.''${host}.config.system.build.vm" \
        --out-link "result-vm-''${host}"

      echo "==> Booting VM..."
      exec "./result-vm-''${host}/bin/run-''${host}-vm"
    '';
  in {
    devShells.default = pkgs.mkShell {
      name = "alice-dev";
      packages = [build-vm];
      shellHook = ''
        echo ""
        echo "  alice dev shell — disposable VM testing"
        echo ""
        echo "  build-vm <host>   build and boot a NixOS host in QEMU"
        echo ""
      '';
    };
  };
}
