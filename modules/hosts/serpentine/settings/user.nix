{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.userSystemConfig = {pkgs, ...}: {
    users.users.alice = {
      isNormalUser = true;
      description = "Alice";
      home = "/home/alice";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
        "input"
        "greeter"
      ];
    };
    virtualisation.vmVariant.users.users.alice.initialPassword = "test";
  };
}
