{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineServicesOverride = {lib, ...}: {
    imports = [
      self.custom.commonModules.systemServices
    ];
    services = {
      input-remapper = {
        enable = lib.mkForce true;
        enableUdevRules = lib.mkForce true;
      };
    };
  };
}
