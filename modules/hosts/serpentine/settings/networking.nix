{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineNetworking = _: {
    networking = {
      hostName = "serpentine";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
