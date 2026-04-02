{
  description = "Alice's NixOS Flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestianix = {
      url = "github:Xellor-Dev/caelestia-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-cachyos-kernel,
      caelestianix,
      antigravity-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        sin = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/sin/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
            }
            caelestianix.homeManagerModules.default
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
                environment.systemPackages = with pkgs; [
                  # antigravity-nix.packages.x86_64-linux.default
                ];
              }
            )
          ];
        };
      };
    };
}
