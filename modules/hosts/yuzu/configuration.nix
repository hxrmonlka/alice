{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.yuzuHostConfig = {...}: {
    imports = [
      self.nixosModules.yuzuNetworking
      self.nixosModules.yuzuBootSettings
      self.nixosModules.yuzuPackages
      self.nixosModules.yuzuServices

      # Subsection: Hardware Settings (under ./modules/hardware)
      self.custom.hardwareModules.qemuHardware
      self.custom.hardwareModules.amdSettings

      # Subsection: Common
      self.custom.commonModules.fonts

      # Subsection: Borrowing Modules
      self.nixosModules.serpentineUserSystemConfig
    ];
    system.stateVersion = "26.05";
  };
}
