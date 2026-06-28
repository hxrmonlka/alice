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
  flake.nixosConfigurations.yuzu = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules = [
      self.nixosModules.yuzuHostConfig
    ];
  };
  #  flake.nixosConfigurations.aux = inputs.nixpkgs.lib.nixosSystem {
  #    specialArgs = {inherit self inputs;};
  #    modules = [
  #      self.nixosModules.auxVm
  #    ];
  #  };
  #  flake.nixosConfigurations.maple = inputs.nixpkgs.lib.nixosSystem {
  #    specialArgs = {inherit self inputs;};
  #    modules = [
  #      self.nixosModules.mapleHostConfig
  #    ];
  #  };
}
