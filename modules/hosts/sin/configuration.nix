{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinConfig = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
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
    system.stateVersion = "25.11";
  };
}
