{
  self,
  inputs,
  ...
}: let
  system = "x86_64-linux";
in {
  flake.custom.system-modules.kobo = {pkgs, ...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
      inputs.lumina.homeModules.lumina-cli
      (inputs.lumina.lib.signatures.mkStandaloneSignature "kobo" "yianyi")
    ];

    home = {
      username = "yianyi";
      homeDirectory = "/home/yianyi";
      stateVersion = "26.05";
      packages = with pkgs; [
        nixd
        alejandra
        inputs.lumina.packages.${system}.sklauncher
        inputs.lumina.packages.${system}.chatgpt
      ];
    };

    programs = {
      lumina-cli.enable = true;
      home-manager.enable = true;
      zen-browser = {
        enable = true;
        setAsDefaultBrowser = true;
      };
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
      self.custom.system-modules.kobo-bash
      self.custom.system-modules.kobo-waybar
      self.custom.system-modules.kobo-sway
      self.custom.home-common.fastfetchConfig
      self.custom.home-common.fonts
      self.custom.system-modules.generic-linux
    ];
  };
}
