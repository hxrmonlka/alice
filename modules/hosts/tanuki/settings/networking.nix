{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiNetworking = _: {
    networking = {
      hostName = "tanuki";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
