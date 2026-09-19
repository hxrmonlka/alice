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
  };
}
