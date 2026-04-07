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

    nix = {
      settings = {
        substituters = [
          "https://attic.xuyh0120.win/lantian"
        ];
        trusted-public-keys = [
          "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        ];
      };
    };
    system.stateVersion = "25.11";
  };
}
