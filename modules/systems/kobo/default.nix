{
  self,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  flake.custom.system-modules.kobo = {...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
      (inputs.lumina.lib.signatures.mkStandaloneSignature "kobo" "yianyi")
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

  flake.homeConfigurations."yianyi@kobo" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    extraSpecialArgs = {
      inherit inputs self;
      hostName = "kobo";
    };
    modules = [
      self.custom.system-modules.kobo
      self.custom.system-modules.kobo-bedrock
      self.custom.system-modules.kobo-sway
      self.custom.home-common.fastfetchConfig
      self.custom.system-modules.generic-linux
    ];
  };
}
