{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tanukiUserSystemConfig = {...}: {
    # TODO: Merge users list into a globalized module.
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
