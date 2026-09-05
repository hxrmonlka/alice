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
      self.nixosModules.tanukiHardware

      # Common section
      self.custom.commonModules.nixSettings
      self.custom.commonModules.fonts

      # Hardware section
      self.nixosModules.tanukiHardwareSettings
      self.custom.hardwareModules.asustuf
    ];
    system.stateVersion = "26.05";
  };
}
