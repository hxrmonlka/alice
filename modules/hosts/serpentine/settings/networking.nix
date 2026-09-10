{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.networking = _: {
    networking = {
      hostName = "serpentine";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
