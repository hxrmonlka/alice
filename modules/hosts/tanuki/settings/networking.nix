{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.networking = _: {
    networking = {
      hostName = "tanuki";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
