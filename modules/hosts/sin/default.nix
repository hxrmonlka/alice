{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.sin = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.sinConfig
    ];
  };
}
