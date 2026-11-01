{
  self,
  inputs,
  ...
}: {
  flake.custom.serpentine.servicesOverride = {
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.custom.commonModules.systemServices
    ];

    systemd.services.libvirt-default-network = {
      # Supposedly for activating libvirt since /etc gets reset upon rebuilds.
      description = "Start libvirt default network";
      after = ["libvirtd.service"];
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.libvirt}/bin/virsh net-start default";
        ExecStop = "${pkgs.libvirt}/bin/virsh net-destroy default";
        User = "root";
      };
    };

    systemd.services.input-remapper-autoload = {
      description = "Autoload input-remapper presets before the greeter starts";
      wants = ["input-remapper.service"];
      after = ["input-remapper.service"];
      before = [
        "greetd.service"
        "display-manager.service"
      ];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "oneshot";
        User = "alice";
        ExecStart = "${pkgs.input-remapper}/bin/input-remapper-control --command autoload";
      };
    };

    services = {
      gvfs.enable = true;
      accounts-daemon.enable = true;
      tumbler.enable = true;
      xserver.enable = lib.mkForce false;
      input-remapper = {
        enable = lib.mkForce true;
        enableUdevRules = lib.mkForce true;
      };
    };
  };
}
