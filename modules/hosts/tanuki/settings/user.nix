{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.userSystemConfig = {...}: {
    users.users.konoe = {
      isNormalUser = true;
      description = "Konoe";
      home = "/home/konoe";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
    virtualisation.vmVariant.users.users.konoe.initialPassword = "test";
  };
}
