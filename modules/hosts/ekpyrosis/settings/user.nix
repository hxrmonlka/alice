{
  self,
  inputs,
  ...
}: {
  flake.custom.ekpyrosis.userSystemConfig = {pkgs, ...}: {
    users.users.alice = {
      isNormalUser = true;
      description = "Alice";
      home = "/home/alice";
      shell = pkgs.nushell;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
        "input"
        "greeter"
      ];
    };
    home-manager.backupFileExtension = "backup";
    virtualisation.vmVariant = {
      users.users.alice.initialPassword = "test";
      environment.sessionVariables = {
        WLR_RENDERER_ALLOW_SOFTWARE = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        LIBGL_ALWAYS_SOFTWARE = "1";
      };
    };
  };
}
