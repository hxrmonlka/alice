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

    services = {
      tumbler.enable = true;
      xserver.enable = lib.mkForce false;
      input-remapper = {
        enable = lib.mkForce true;
        enableUdevRules = lib.mkForce true;
      };
    };
  };
}
