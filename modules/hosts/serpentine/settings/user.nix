{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.userSystemConfig = {...}: {
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
