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
      self.nixosModules.tanukiHardware
      self.nixosModules.tanukiPackages

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
        self.homeModules.konoeCore
        self.custom.konoeModules.spotify
      ];
    };
    system.stateVersion = "26.05";
  };
}
