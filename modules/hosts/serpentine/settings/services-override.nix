{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.servicesOverride = {lib, ...}: {
    imports = [
      self.custom.commonModules.systemServices
    ];
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      printing.enable = lib.mkForce true;
      input-remapper = {
        enable = lib.mkForce true;
        enableUdevRules = lib.mkForce true;
      };
    };
  };
}
