{
  self,
  inputs,
  ...
}: {
  flake.custom.konoe.zen-browser = {pkgs, ...}: {
    imports = [
      inputs.zen-browser.homeManagerModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
  };
}
