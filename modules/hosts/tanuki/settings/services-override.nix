{
  self,
  inputs,
  ...
}: {
  flake.custom.tanuki.services-override = {pkgs, ...}: {
    imports = [self.custom.commonModules.systemServices];

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      asusd.enable = true;
    };

    systemd.services.aura-static-color = {
      description = "Set ASUS Aura keyboard backlight to a static color";
      after = ["asusd.service"];
      requires = ["asusd.service"];
      wantedBy = ["multi-user.target"];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.asusctl}/bin/asusctl aura effect static -c 8dcfec";
      };
    };
  };
}
