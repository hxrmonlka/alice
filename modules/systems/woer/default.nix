{
  self,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  flake.custom.system-modules.woer = {...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
      (inputs.lumina.lib.signatures.mkStandaloneSignature "woer" "yianyi")
    ];

    home = {
      username = "yianyi";
      homeDirectory = "/home/yianyi";
      stateVersion = "26.05";
      packages = [
        inputs.lumina.packages.${system}.sklauncher
        inputs.lumina.packages.${system}.chatgpt
      ];
    };

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
  };

  flake.homeConfigurations."yianyi@woer" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    extraSpecialArgs = {
      inherit inputs self;
      hostName = "woer";
    };
    modules = [
      self.custom.system-modules.arch-linux
      self.custom.system-modules.woer
      self.custom.home-common.fastfetchConfig
      self.custom.system-modules.system-manager
      self.custom.system-modules.generic-linux
    ];
  };
}
