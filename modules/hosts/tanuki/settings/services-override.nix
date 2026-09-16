{self,inputs,...}: {
  flake.custom.tanuki.services-override = {...}: {
    imports = [self.custom.commonModules.systemServices];

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
