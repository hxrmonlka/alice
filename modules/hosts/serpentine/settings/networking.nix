{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.networking = _: {
    networking = {
      firewall.trustedInterfaces = ["virbr0"];
      hostName = "serpentine";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
