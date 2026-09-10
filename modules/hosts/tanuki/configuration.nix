{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.hostConfig = {...}: {
    imports = [
      # Inputs Section
      inputs.lumina.nixosModules.signature
      inputs.home-manager.nixosModules.home-manager

      # Self section
      self.custom.tanuki.locales
      self.custom.tanuki.networking
      self.custom.tanuki.userSystemConfig
      self.custom.tanuki.programs
      self.custom.tanuki.packages

      # Common section
      self.custom.commonModules.nixSettings
      self.custom.commonModules.fonts
      self.custom.commonModules.bootSettings

      # Gaming section
      self.nixosModules.gamingSettings

      # Hardware section
      self.custom.hardwareModules.asusSettings
      self.custom.hardwareModules.asustuf
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {inherit inputs self;};
      users.konoe.imports = [
        # Inputs section
        inputs.spicetify-nix.homeManagerModules.default

        # Self section
        self.custom.konoe.core
        self.custom.konoe.spotify
      ];
    };
    system.stateVersion = "26.05";
  };
}
