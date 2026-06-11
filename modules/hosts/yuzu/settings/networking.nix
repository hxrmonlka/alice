{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.yuzuNetworking = {...}: {
    networking = {
      hostName = "tane"; # (種)
      networkmanager = {
        enable = true;
        wifi.macAddress = "stable-ssid";
      };
    };
  };
}
