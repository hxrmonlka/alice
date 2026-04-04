{
  description = "Alice's NixOS Flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    niri-flake.url = "github:sodiboo/niri-flake";
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    nvimdots.url = "github:ayamir/nvimdots";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-cachyos-kernel,
    antigravity-nix,
    noctalia,
    quickshell,
    rust-overlay,
    ...
  } @ inputs: {
    nixosConfigurations = {
      sin = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/sin/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
          }
          (
            {pkgs, ...}: {
              nixpkgs.overlays = [
                nix-cachyos-kernel.overlays.pinned
                rust-overlay.overlays.default
              ];
              environment.systemPackages = with pkgs; [
                rust-bin.stable.latest.default
              ];
            }
          )
        ];
      };
    };
  };
}
