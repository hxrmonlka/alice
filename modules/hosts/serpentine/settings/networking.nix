{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.serpentineNetworking =
    { ... }:
    {
      networking = {
        hostName = "serpentine";
        networkmanager = {
          enable = true;
          wifi.macAddress = "random";
        };
      };
    };
}
