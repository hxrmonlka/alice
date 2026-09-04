{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiUserSystemConfig = {...}: {
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
