{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.hostConfig = {...}: {
    imports = [
      # Inputs section
      inputs.home-manager.nixosModules.home-manager
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.mangowc.nixosModules.mango
      inputs.lumina.nixosModules.signature

      # Self section (under ./modules/hosts/serpentine/)
      self.custom.serpentine.networking
      self.custom.serpentine.programs
      self.custom.serpentine.userSystemConfig
      self.custom.serpentine.packages
      self.custom.serpentine.locales
      self.custom.serpentine.environment
      self.custom.serpentine.flatpaks
      self.custom.serpentine.servicesOverride
      self.custom.serpentine.bootOverride
      self.custom.serpentine.gamingOverride

      # Subsection: Gaming modules (under ./modules/gaming)
      self.nixosModules.games

      # Subsection: Common (under ./modules/common)
      self.custom.commonModules.fonts
      self.custom.commonModules.nixSettings
      self.custom.commonModules.inputRemapperPolkit
      self.custom.commonModules.virtualisation

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
        inputs.lumina.homeModules.signature
        inputs.nvimdots.homeManagerModules.default
        inputs.spicetify-nix.homeManagerModules.default
        inputs.mangowc.hmModules.mango
        inputs.nixcord.homeModules.nixcord
        inputs.dms.homeModules.dank-material-shell

        # Self section
        self.custom.alice.core
        self.custom.alice.xsettingsd
        self.custom.alice.cursorSettings
        self.custom.alice.cursorThemes
        self.custom.alice.packages
        self.custom.alice.neovim
        self.custom.alice.niri
        self.custom.alice.gitTools
        self.custom.alice.kitty
        self.custom.alice.starship
        self.custom.alice.starshipMatugen
        self.custom.alice.browser
        self.custom.alice.spotify
        self.custom.alice.btop
        self.custom.alice.shells
        self.custom.alice.nixcord
        self.custom.alice.zed
        self.custom.alice.fastfetchConfig
        self.custom.alice.yazi
        self.custom.alice.zathura
        self.custom.alice.dms
        self.custom.alice.gtk
        self.custom.alice.steamFix
      ];
    };
    system.stateVersion = "26.05";
  };
}
