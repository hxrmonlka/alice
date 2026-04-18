{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sinUserSystemConfig = {...}: {
    users.users.alice = {
      isNormalUser = true;
      description = "Alice";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
      ];
    };
  };
}
