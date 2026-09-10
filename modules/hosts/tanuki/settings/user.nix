{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.userSystemConfig = {...}: {
    users.users.konoe = {
      isNormalUser = true;
      description = "Konoe";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
