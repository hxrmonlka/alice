{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineHostConfig = {...}: {
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
      self.nixosModules.serpentineEnvironment
      self.nixosModules.serpentineFlatpakConfig

      # Subsection: Gaming modules (under ./modules/gaming)
      self.nixosModules.gamingSettings
      self.nixosModules.games

      # Subsection: Common (under ./modules/common)
      self.custom.commonModules.fonts
      self.custom.commonModules.bootSettings
      self.custom.commonModules.nixSettings
      self.custom.commonModules.systemServices
      self.custom.commonModules.inputRemapperPolkit

      # Subsection: Hardware Settings (under ./modules/hardware)
      self.custom.hardwareModules.intelSettings
      self.custom.hardwareModules.noctHardware
      self.custom.hardwareModules.otdSettings

      # Misc
      self.nixosModules.dgreet
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
        inputs.dms.homeModules.dank-material-shell

        # Self section
        self.homeModules.aliceCore
        self.homeModules.aliceXsettingsd
        self.custom.aliceModules.cursorSettings
        self.custom.aliceModules.cursorThemes
        self.custom.aliceModules.packages
        self.custom.aliceModules.neovim
        self.custom.aliceModules.niri
        self.custom.aliceModules.mangoConfig
        self.custom.aliceModules.gitTools
        self.custom.aliceModules.kitty
        self.custom.aliceModules.starship
        self.custom.aliceModules.browser
        self.custom.aliceModules.spotify
        self.custom.aliceModules.btop
        self.custom.aliceModules.shells
        self.custom.aliceModules.nixcord
        self.custom.aliceModules.zed
        self.custom.aliceModules.fastfetchConfig
        self.custom.aliceModules.yazi
        self.custom.aliceModules.zathura
        self.custom.aliceModules.dms
        self.custom.aliceModules.gtk
      ];
    };
    system.stateVersion = "26.05";
  };
}
