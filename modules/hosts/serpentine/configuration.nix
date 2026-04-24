{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineHostConfig = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      # Inputs section
      inputs.home-manager.nixosModules.home-manager
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.mangowc.nixosModules.mango

      # Self section (under ./modules/hosts/serpentine/)
      self.nixosModules.serpentineNetworking
      self.nixosModules.serpentineProgramsConfig
      self.nixosModules.serpentineUserSystemConfig
      self.nixosModules.serpentinePackages
      self.nixosModules.serpentineLocales
      self.nixosModules.serpentineServices
      self.nixosModules.serpentineBootSettings
      self.nixosModules.serpentineEnvironment
      self.nixosModules.serpentineFlatpakConfig

      # Subsection: Gaming modules (under ./modules/gaming)
      self.nixosModules.gamingSettings
      self.nixosModules.games

      # Subsection: Common
      self.custom.commonModules.fonts
      self.custom.commonModules.virtualisation

      # Subsection: Hardware Settings (under ./modules/hardware)
      self.custom.hardwareModules.intelSettings
      self.custom.hardwareModules.qemuHardware
      self.custom.hardwareModules.otdSettings
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {inherit inputs self;};
      users.alice.imports = [
        # Inputs section
        inputs.nvimdots.homeManagerModules.default
        inputs.spicetify-nix.homeManagerModules.default
        inputs.mangowc.hmModules.mango
        inputs.nixcord.homeModules.nixcord

        # Self section
        self.homeModules.aliceCore
        self.custom.userModules.alicePackages
        self.custom.userModules.aliceNeovim
        self.custom.userModules.aliceNiri
        self.custom.userModules.aliceMangoConfig
        self.custom.userModules.aliceGitTools
        self.custom.userModules.aliceZsh
        self.custom.userModules.aliceKitty
        self.custom.userModules.aliceStarship
        self.custom.userModules.aliceBrowser
        self.custom.userModules.aliceSpotify
        self.custom.userModules.aliceBtop
        self.custom.userModules.aliceYazi
        self.custom.userModules.nixcord
      ];
    };
    system.stateVersion = "25.11";
  };
}
