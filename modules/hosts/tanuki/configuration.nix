{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.hostConfig = {...}: {
    imports = [
      # Inputs Section
      (inputs.lumina.lib.signatures.mkHostSignature "tanuki")
      inputs.home-manager.nixosModules.home-manager

      # Self section
      self.custom.tanuki.locales
      self.custom.tanuki.networking
      self.custom.tanuki.userSystemConfig
      self.custom.tanuki.programs
      self.custom.tanuki.packages
      self.custom.tanuki.flatpaks
      self.custom.tanuki.services-override

      # Common section
      self.custom.commonModules.nixSettings
      self.custom.commonModules.fonts
      self.custom.commonModules.bootSettings

      # Gaming section
      self.nixosModules.gamingSettings
      self.nixosModules.games

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
        (inputs.lumina.lib.signatures.mkUserSignature "tanuki" "konoe")
        inputs.spicetify-nix.homeManagerModules.default

        # Self section
        self.custom.konoe.core
        self.custom.konoe.spotify
        self.custom.konoe.niri
        self.custom.konoe.alacritty
        self.custom.konoe.code
        self.custom.konoe.zen-browser

        # Common section
        self.custom.home-common.fastfetchConfig
      ];
    };
    system.stateVersion = "26.05";
  };
}
