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
      tumbler.enable = true;
      xserver.enable = lib.mkForce false;
      input-remapper = {
        enable = lib.mkForce true;
        enableUdevRules = lib.mkForce true;
      };
    };
  };
}
