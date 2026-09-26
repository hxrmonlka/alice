{
  self,
  inputs,
  ...
}: {
  flake.custom.konoe.zen-browser = {pkgs, ...}: {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
  };
}
