{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.serpentineUserSystemConfig = {...}: {
    users.users.alice = {
      isNormalUser = true;
      description = "Alice";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
        "input"
      ];
    };
  };
}
