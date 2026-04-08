{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations."alice@sin" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    extraSpecialArgs = {inherit inputs self;};

    modules = [
      self.homeModules.aliceCore
      self.homeModules.alicePackages

      # Programs Section
      self.homeModules.aliceNeovim
      self.homeModules.aliceGitConfig
      self.homeModules.aliceKitty
      self.homeModules.aliceOmp
      self.homeModules.aliceZsh

      # Desktop Section
      self.homeModules.aliceNiri
    ];
  };
}
