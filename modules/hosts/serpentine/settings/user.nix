{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.userSystemConfig = {...}: {
    users.users.alice = {
      isNormalUser = true;
      description = "Alice";
      home = "/home/alice";
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
