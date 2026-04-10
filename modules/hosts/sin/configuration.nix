{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.sinConfig =
    {
      pkgs,
      lib,
      ...
    }:
    {
      imports = [
        # Inputs section
        # inputs.niri.nixosModules.niri
        inputs.home-manager.nixosModules.home-manager

        # Self section
        self.nixosModules.sinHardware
        self.nixosModules.sinNetworking
        self.nixosModules.sinProgramsConfig
        self.nixosModules.sinUserSystemConfig
        self.nixosModules.sinPackages
        self.nixosModules.sinLocales
        self.nixosModules.sinServices
        self.nixosModules.sinBootSettings
        self.nixosModules.sinEnvironment
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs self; };
        users.alice.imports = [
          # Inputs section
          inputs.nvimdots.homeManagerModules.default

          # Self section
          self.homeModules.aliceCore
          self.homeModules.alicePackages
          self.homeModules.aliceNeovim
          self.homeModules.aliceNiri
          self.homeModules.aliceProgramsGit
          self.homeModules.aliceProgramsZsh
          self.homeModules.aliceProgramsKitty
          self.homeModules.aliceProgramsOmp
          self.homeModules.aliceGamingOsu
        ];
      };

      system.stateVersion = "25.11";
    };
}
