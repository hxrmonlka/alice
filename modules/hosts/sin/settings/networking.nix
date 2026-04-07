{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinNetworking = {...}: {
    networking = {
      hostName = "sin";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
