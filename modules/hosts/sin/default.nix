{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.sin = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules = [
      self.nixosModules.sinHostConfig
    ];
  };
}
