{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.serpentine = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules = [
      self.nixosModules.serpentineHostConfig
    ];
  };
  #  flake.nixosConfigurations.maple = inputs.nixpkgs.lib.nixosSystem {
  #    specialArgs = {inherit self inputs;};
  #    modules = [
  #      self.nixosModules.mapleHostConfig
  #    ];
  #  };
}
