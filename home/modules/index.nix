{ ... }: {
  imports = [
    ./features/index.nix
    ./programs/index.nix
    # No dedicated directories.
    ./packages.nix
  ];
}
