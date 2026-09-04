{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiHostConfig = {...}: {
    imports = [
      # Inputs Section
      inputs.lumina.nixosModules.signature

      # Self section
      self.nixosModules.tanukiLocales
      self.nixosModules.tanukiNetworking
      self.nixosModules.tanukiUserSystemConfig
      self.nixosModules.tanukiPrograms
      self.nixosModules.tanukiBootOverride

      # Common section
      self.custom.commonModules.nixSettings
    ];
    system.stateVersion = "26.05";
  };
}
