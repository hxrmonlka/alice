{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinHostConfig = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      # Inputs section
      inputs.home-manager.nixosModules.home-manager
      inputs.nix-flatpak.nixosModules.nix-flatpak

      # Self section (under ./modules/hosts/sin/)
      self.nixosModules.sinNetworking
      self.nixosModules.sinProgramsConfig
      self.nixosModules.sinUserSystemConfig
      self.nixosModules.sinPackages
      self.nixosModules.sinLocales
      self.nixosModules.sinServices
      self.nixosModules.sinBootSettings
      self.nixosModules.sinEnvironment
      self.nixosModules.sinFlatpakConfig

      # Subsection: Common
      self.nixosModules.fonts
      self.nixosModules.virtualisation

      # Subsection: Hardware Settings (under ./modules/hardware)
      self.nixosModules.intelSettings
      self.nixosModules.qemuHardware
      self.nixosModules.otdSettings

      # Subsection: Gaming modules (under ./modules/gaming)
      self.nixosModules.gamingSettings
      self.nixosModules.games
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {inherit inputs self;};
      users.alice.imports = [
        # Inputs section
        inputs.nvimdots.homeManagerModules.default
        inputs.spicetify-nix.homeManagerModules.default
        inputs.nixcord.homeModules.nixcord

        # Self section
        self.homeModules.aliceCore
        self.homeModules.alicePackages
        self.homeModules.aliceNeovim
        self.homeModules.aliceNiri
        self.homeModules.aliceProgramsGitTools
        self.homeModules.aliceProgramsZsh
        self.homeModules.aliceProgramsKitty
        self.homeModules.aliceProgramsStarship
        self.homeModules.aliceProgramsBrowser
        self.homeModules.aliceProgramsSpotify
        self.homeModules.aliceProgramsBtop
        self.homeModules.nixcord
      ];
    };

    system.stateVersion = "25.11";
  };
}
