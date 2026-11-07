{
  self,
  inputs,
  ...
}: {
  flake.custom.ekpyrosis.networking = _: {
    networking = {
      firewall.trustedInterfaces = ["virbr0"];
      hostName = "ekpyrosis";
      networkmanager = {
        enable = true;
        wifi.macAddress = "random";
      };
    };
  };
}
